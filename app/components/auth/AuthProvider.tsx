"use client";

import {
  createContext, useCallback, useContext, useEffect, useMemo, useRef, useState,
  type ReactNode,
} from "react";
import type { Session, User } from "@supabase/supabase-js";

import { getBrowserSupabase } from "@/lib/supabase/browser";
import {
  claimLocalStudentState,
  clearLocalStudentState,
  localStudentStateOwner,
  mergeStudentStates,
  normalizeSyncedStudentState,
  prepareLocalStateForNewAccount,
  readLocalStudentState,
  studentStatesEqual,
  STUDENT_STATE_CHANGE_EVENT,
  writeLocalStudentState,
  type SyncedStudentState,
} from "@/lib/account/studentState";

type SyncStatus = "idle" | "syncing" | "synced" | "offline";

interface AuthContextValue {
  user: User | null;
  session: Session | null;
  loading: boolean;
  syncStatus: SyncStatus;
  displayName: string;
  signIn: (email: string, password: string) => Promise<string | null>;
  signUp: (name: string, email: string, password: string) => Promise<{ error: string | null; needsConfirmation: boolean }>;
  signOut: () => Promise<void>;
  sendPasswordReset: (email: string) => Promise<string | null>;
  updatePassword: (password: string) => Promise<string | null>;
  syncNow: () => Promise<void>;
}

const AuthContext = createContext<AuthContextValue | null>(null);

function remoteStateFor(user: User) {
  const value = user.user_metadata?.campusai as unknown;
  return normalizeSyncedStudentState(value);
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const supabase = useMemo(() => getBrowserSupabase(), []);
  const [session, setSession] = useState<Session | null>(null);
  const [loading, setLoading] = useState(true);
  const [syncStatus, setSyncStatus] = useState<SyncStatus>("idle");
  const syncing = useRef(false);
  const syncPending = useRef(false);
  const debounce = useRef<number | null>(null);
  const sessionRef = useRef<Session | null>(null);

  const syncState = useCallback(async (activeUser?: User | null) => {
    const user = activeUser ?? sessionRef.current?.user ?? null;
    if (!user) return;
    if (syncing.current) {
      syncPending.current = true;
      return;
    }
    syncing.current = true;
    setSyncStatus("syncing");

    try {
      do {
        syncPending.current = false;
        const { data, error: userError } = await supabase.auth.getUser();
        if (userError || !data.user) throw userError ?? new Error("Authentication session is unavailable.");
        const freshUser = data.user;
        if (sessionRef.current) {
          sessionRef.current = { ...sessionRef.current, user: freshUser };
        }
        const owner = localStudentStateOwner();
        if (owner && owner !== freshUser.id) clearLocalStudentState();
        const local = readLocalStudentState();
        const remote = remoteStateFor(freshUser);
        const merged = mergeStudentStates(local, remote);

        if (!studentStatesEqual(local, merged)) writeLocalStudentState(merged);
        if (!studentStatesEqual(remote, merged)) {
          const { data, error } = await supabase.auth.updateUser({
            data: { campusai: merged },
          });
          if (error) throw error;
          if (data.user && sessionRef.current) {
            sessionRef.current = { ...sessionRef.current, user: data.user };
          }
        }
        claimLocalStudentState(freshUser.id);
      } while (syncPending.current);
      setSyncStatus("synced");
    } catch {
      setSyncStatus("offline");
    } finally {
      syncing.current = false;
    }
  }, [supabase]);

  useEffect(() => {
    let mounted = true;

    void supabase.auth.getSession().then(({ data }) => {
      if (!mounted) return;
      sessionRef.current = data.session;
      setSession(data.session);
      setLoading(false);
      if (data.session?.user) void syncState(data.session.user);
    });

    const { data: subscription } = supabase.auth.onAuthStateChange((event, nextSession) => {
      if (nextSession?.user) {
        const owner = localStudentStateOwner();
        if (owner && owner !== nextSession.user.id) clearLocalStudentState();
      } else if (event === "SIGNED_OUT") {
        clearLocalStudentState();
      }
      sessionRef.current = nextSession;
      setSession(nextSession);
      setLoading(false);
      if (nextSession?.user && (event === "INITIAL_SESSION" || event === "SIGNED_IN")) {
        window.setTimeout(() => void syncState(nextSession.user), 0);
      } else {
        if (!nextSession) setSyncStatus("idle");
      }
    });

    return () => {
      mounted = false;
      subscription.subscription.unsubscribe();
    };
  }, [supabase, syncState]);

  useEffect(() => {
    const handleChange = (event: Event) => {
      if ((event as CustomEvent).detail?.source === "cloud" || !session?.user) return;
      if (debounce.current) window.clearTimeout(debounce.current);
      debounce.current = window.setTimeout(() => void syncState(session.user), 700);
    };
    window.addEventListener(STUDENT_STATE_CHANGE_EVENT, handleChange);
    return () => {
      window.removeEventListener(STUDENT_STATE_CHANGE_EVENT, handleChange);
      if (debounce.current) window.clearTimeout(debounce.current);
    };
  }, [session?.user, syncState]);

  const value = useMemo<AuthContextValue>(() => ({
    user: session?.user ?? null,
    session,
    loading,
    syncStatus,
    displayName: String(session?.user.user_metadata?.display_name ?? session?.user.email?.split("@")[0] ?? "Student"),
    signIn: async (email, password) => {
      const { error } = await supabase.auth.signInWithPassword({ email, password });
      return error?.message ?? null;
    },
    signUp: async (name, email, password) => {
      const campusai: SyncedStudentState = prepareLocalStateForNewAccount();
      const { data, error } = await supabase.auth.signUp({
        email,
        password,
        options: {
          data: { display_name: name.trim(), campusai },
          emailRedirectTo: `${window.location.origin}/auth/callback?next=/dashboard`,
        },
      });
      return { error: error?.message ?? null, needsConfirmation: !data.session && Boolean(data.user) };
    },
    signOut: async () => {
      await supabase.auth.signOut();
      clearLocalStudentState();
    },
    sendPasswordReset: async (email) => {
      const { error } = await supabase.auth.resetPasswordForEmail(email, {
        redirectTo: `${window.location.origin}/auth/callback?next=/reset-password`,
      });
      return error?.message ?? null;
    },
    updatePassword: async (password) => {
      const { error } = await supabase.auth.updateUser({ password });
      return error?.message ?? null;
    },
    syncNow: () => syncState(),
  }), [loading, session, supabase, syncState, syncStatus]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const value = useContext(AuthContext);
  if (!value) throw new Error("useAuth must be used inside AuthProvider");
  return value;
}
