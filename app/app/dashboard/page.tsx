import type { Metadata } from "next";
import { redirect } from "next/navigation";
import StudentDashboard from "@/components/dashboard/StudentDashboard";
import { createServerSupabase } from "@/lib/supabase/server";

export const metadata: Metadata = {
  title: "My CampusAI | TNEA 2026",
  description: "Your personalized TNEA recommendations, counselling progress and next action.",
};

export default async function DashboardPage() {
  const supabase = await createServerSupabase();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  return <StudentDashboard />;
}
