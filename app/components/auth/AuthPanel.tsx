"use client";

import { useEffect, useState, type FormEvent } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import {
  ArrowRight, Check, Eye, EyeOff, LockKeyhole, Mail, ShieldCheck, Sparkles, UserRound,
} from "lucide-react";

import { useAuth } from "@/components/auth/AuthProvider";

type AuthMode = "login" | "signup" | "forgot" | "reset";

const copy: Record<AuthMode, { eyebrow: string; title: string; description: string }> = {
  login: {
    eyebrow: "Welcome back",
    title: "Continue your counselling journey",
    description: "Your profile, recommendations and counselling progress stay together.",
  },
  signup: {
    eyebrow: "Create your account",
    title: "Your entire TNEA journey, in one place",
    description: "Save your progress securely and continue from any of your devices.",
  },
  forgot: {
    eyebrow: "Account recovery",
    title: "Reset your password",
    description: "We’ll email you a secure link to choose a new password.",
  },
  reset: {
    eyebrow: "Secure your account",
    title: "Choose a new password",
    description: "Use a strong password you do not reuse on other websites.",
  },
};

function passwordIssue(password: string) {
  if (password.length < 8) return "Use at least 8 characters.";
  if (!/[A-Za-z]/.test(password) || !/[0-9]/.test(password)) return "Include at least one letter and one number.";
  return "";
}

function friendlyAuthError(message: string) {
  const normalized = message.toLowerCase();
  if (normalized.includes("invalid login credentials")) return "The email or password is incorrect.";
  if (normalized.includes("email not confirmed")) return "Confirm your email before signing in.";
  if (normalized.includes("user already registered")) return "An account already exists for this email. Sign in instead.";
  if (normalized.includes("rate limit")) return "Too many attempts. Please wait a few minutes and try again.";
  if (normalized.includes("same password")) return "Choose a password you have not used for this account.";
  return "CampusAI could not complete that request. Please check your details and try again.";
}

export default function AuthPanel({ mode, initialError = "" }: { mode: AuthMode; initialError?: string }) {
  const router = useRouter();
  const { user, loading, signIn, signUp, sendPasswordReset, updatePassword } = useAuth();
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmation, setConfirmation] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [accepted, setAccepted] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState(initialError);
  const [message, setMessage] = useState("");

  useEffect(() => {
    if (!loading && user && (mode === "login" || mode === "signup")) {
      router.replace("/dashboard");
    }
  }, [loading, mode, router, user]);

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setMessage("");

    if (mode === "signup" && name.trim().length < 2) {
      setError("Enter the student’s name.");
      return;
    }
    if (mode !== "reset" && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim())) {
      setError("Enter a valid email address.");
      return;
    }
    if (mode === "signup" || mode === "reset") {
      const issue = passwordIssue(password);
      if (issue) { setError(issue); return; }
      if (password !== confirmation) { setError("The passwords do not match."); return; }
    }
    if (mode === "signup" && !accepted) {
      setError("Please accept the privacy and terms notice.");
      return;
    }

    setSubmitting(true);
    try {
      if (mode === "login") {
        const nextError = await signIn(email.trim(), password);
        if (nextError) setError(friendlyAuthError(nextError));
        else {
          router.replace("/dashboard");
          router.refresh();
        }
      } else if (mode === "signup") {
        const result = await signUp(name, email.trim(), password);
        if (result.error) setError(friendlyAuthError(result.error));
        else if (result.needsConfirmation) setMessage("Check your email to confirm your CampusAI account. Your progress is ready to sync after you sign in.");
        else router.replace("/dashboard");
      } else if (mode === "forgot") {
        const nextError = await sendPasswordReset(email.trim());
        if (nextError) setError(friendlyAuthError(nextError));
        else setMessage("Password reset email sent. Open the secure link in that email to continue.");
      } else {
        const nextError = await updatePassword(password);
        if (nextError) setError(friendlyAuthError(nextError));
        else {
          setMessage("Password updated. Taking you to your dashboard…");
          window.setTimeout(() => router.replace("/dashboard"), 900);
        }
      }
    } finally {
      setSubmitting(false);
    }
  }

  const showEmail = mode !== "reset";
  const showPasswordField = mode !== "forgot";

  return (
    <main className="relative min-h-[calc(100vh-73px)] overflow-hidden bg-[#070709] px-4 py-10 text-white sm:px-6 sm:py-16">
      <div className="pointer-events-none absolute inset-0 bg-[radial-gradient(circle_at_20%_10%,rgba(99,102,241,0.22),transparent_28%),radial-gradient(circle_at_85%_85%,rgba(34,211,238,0.09),transparent_28%)]" />
      <div className="relative mx-auto grid w-full max-w-6xl overflow-hidden rounded-[30px] border border-white/10 bg-zinc-950/80 shadow-[0_40px_140px_rgba(0,0,0,0.7)] backdrop-blur-2xl lg:grid-cols-[0.9fr_1.1fr]">
        <aside className="relative hidden overflow-hidden border-r border-white/[0.08] bg-gradient-to-br from-indigo-600/20 via-black/20 to-cyan-500/10 p-10 lg:flex lg:flex-col lg:justify-between">
          <div className="absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.025)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.025)_1px,transparent_1px)] bg-[size:38px_38px]" />
          <div className="relative">
            <div className="inline-flex items-center gap-2 rounded-full border border-white/10 bg-black/25 px-3 py-1.5 text-xs text-indigo-100"><Sparkles className="h-3.5 w-3.5" /> CampusAI student account</div>
            <h2 className="mt-8 text-4xl font-semibold leading-tight tracking-tight">Clarity from your first shortlist to final reporting.</h2>
            <p className="mt-5 max-w-md text-sm leading-7 text-zinc-400">One private workspace for the decisions, dates and evidence that matter during TNEA counselling.</p>
          </div>
          <div className="relative space-y-4">
            {[
              "Continue your profile on another device",
              "Keep recommendation preferences and progress together",
              "Get a clear next action every time you return",
            ].map((item) => <div key={item} className="flex items-start gap-3 text-sm text-zinc-300"><span className="mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-emerald-400/10 text-emerald-300"><Check className="h-3 w-3" /></span>{item}</div>)}
          </div>
        </aside>

        <section className="p-5 sm:p-10 lg:p-14">
          <div className="mx-auto max-w-md">
            <p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-300">{copy[mode].eyebrow}</p>
            <h1 className="mt-3 text-3xl font-semibold tracking-tight sm:text-4xl">{copy[mode].title}</h1>
            <p className="mt-3 text-sm leading-6 text-zinc-500">{copy[mode].description}</p>

            <form onSubmit={submit} className="mt-8 space-y-4" noValidate>
              {mode === "signup" && <label className="block">
                <span className="text-sm font-medium text-zinc-300">Student name</span>
                <span className="relative mt-2 block"><UserRound className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-600" /><input value={name} onChange={(event) => setName(event.target.value)} autoComplete="name" placeholder="What should we call you?" className="h-13 w-full rounded-xl border border-white/10 bg-black/30 pl-11 pr-4 text-sm outline-none transition placeholder:text-zinc-700 focus:border-indigo-400/60 focus:ring-4 focus:ring-indigo-500/10" /></span>
              </label>}

              {showEmail && <label className="block">
                <span className="text-sm font-medium text-zinc-300">Email address</span>
                <span className="relative mt-2 block"><Mail className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-600" /><input type="email" value={email} onChange={(event) => setEmail(event.target.value)} autoComplete="email" placeholder="student@example.com" className="h-13 w-full rounded-xl border border-white/10 bg-black/30 pl-11 pr-4 text-sm outline-none transition placeholder:text-zinc-700 focus:border-indigo-400/60 focus:ring-4 focus:ring-indigo-500/10" /></span>
              </label>}

              {showPasswordField && <label className="block">
                <span className="flex items-center justify-between text-sm font-medium text-zinc-300">
                  {mode === "reset" ? "New password" : "Password"}
                  {mode === "login" && <Link href="/forgot-password" className="text-xs font-normal text-indigo-300 hover:text-indigo-200">Forgot password?</Link>}
                </span>
                <span className="relative mt-2 block"><LockKeyhole className="absolute left-4 top-1/2 h-4 w-4 -translate-y-1/2 text-zinc-600" /><input type={showPassword ? "text" : "password"} value={password} onChange={(event) => setPassword(event.target.value)} autoComplete={mode === "login" ? "current-password" : "new-password"} placeholder={mode === "login" ? "Enter your password" : "At least 8 characters"} className="h-13 w-full rounded-xl border border-white/10 bg-black/30 pl-11 pr-12 text-sm outline-none transition placeholder:text-zinc-700 focus:border-indigo-400/60 focus:ring-4 focus:ring-indigo-500/10" /><button type="button" onClick={() => setShowPassword((value) => !value)} aria-label={showPassword ? "Hide password" : "Show password"} className="absolute right-4 top-1/2 -translate-y-1/2 text-zinc-600 hover:text-zinc-300">{showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}</button></span>
              </label>}

              {(mode === "signup" || mode === "reset") && <label className="block">
                <span className="text-sm font-medium text-zinc-300">Confirm password</span>
                <input type={showPassword ? "text" : "password"} value={confirmation} onChange={(event) => setConfirmation(event.target.value)} autoComplete="new-password" placeholder="Enter it once more" className="mt-2 h-13 w-full rounded-xl border border-white/10 bg-black/30 px-4 text-sm outline-none transition placeholder:text-zinc-700 focus:border-indigo-400/60 focus:ring-4 focus:ring-indigo-500/10" />
              </label>}

              {mode === "signup" && <label className="flex cursor-pointer items-start gap-3 rounded-xl border border-white/[0.07] bg-white/[0.025] p-3.5 text-xs leading-5 text-zinc-500">
                <input type="checkbox" checked={accepted} onChange={(event) => setAccepted(event.target.checked)} className="mt-0.5 h-4 w-4 accent-indigo-500" />
                <span>I understand CampusAI is independent decision support and does not guarantee allotment or replace the official TNEA portal.</span>
              </label>}

              {error && <div role="alert" className="rounded-xl border border-rose-400/20 bg-rose-500/[0.08] px-4 py-3 text-sm leading-5 text-rose-200">{error}</div>}
              {message && <div role="status" className="rounded-xl border border-emerald-400/20 bg-emerald-500/[0.08] px-4 py-3 text-sm leading-5 text-emerald-100">{message}</div>}

              <button disabled={submitting} type="submit" className="group flex h-13 w-full items-center justify-center gap-2 rounded-xl bg-white px-5 text-sm font-semibold text-black transition hover:bg-indigo-100 disabled:cursor-not-allowed disabled:opacity-60">
                {submitting ? "Please wait…" : mode === "login" ? "Sign in to CampusAI" : mode === "signup" ? "Create my account" : mode === "forgot" ? "Send reset link" : "Update password"}
                {!submitting && <ArrowRight className="h-4 w-4 transition group-hover:translate-x-0.5" />}
              </button>
            </form>

            <div className="mt-6 text-center text-sm text-zinc-500">
              {mode === "login" && <>New to CampusAI? <Link href="/signup" className="font-medium text-white hover:text-indigo-200">Create an account</Link></>}
              {mode === "signup" && <>Already have an account? <Link href="/login" className="font-medium text-white hover:text-indigo-200">Sign in</Link></>}
              {(mode === "forgot" || mode === "reset") && <Link href="/login" className="font-medium text-white hover:text-indigo-200">Back to sign in</Link>}
            </div>

            <div className="mt-7 flex items-center justify-center gap-2 text-[11px] text-zinc-700"><ShieldCheck className="h-3.5 w-3.5" /> Your TNEA portal password is never requested.</div>
          </div>
        </section>
      </div>
    </main>
  );
}
