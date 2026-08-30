import type { Metadata } from "next";
import AuthPanel from "@/components/auth/AuthPanel";

export const metadata: Metadata = { title: "Choose a new password | CampusAI" };

export default function ResetPasswordPage() {
  return <AuthPanel mode="reset" />;
}
