import type { Metadata } from "next";
import AuthPanel from "@/components/auth/AuthPanel";

export const metadata: Metadata = { title: "Sign in | CampusAI" };

export default async function LoginPage({
  searchParams,
}: {
  searchParams: Promise<{ error?: string }>;
}) {
  const { error } = await searchParams;
  const initialError = error === "confirmation"
    ? "That confirmation link is invalid or has expired. Please request a new one."
    : "";
  return <AuthPanel mode="login" initialError={initialError} />;
}
