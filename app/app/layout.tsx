import type { Metadata } from "next";
import "./globals.css";

import Navbar from "@/components/layout/Navbar";
import Footer from "@/components/layout/Footer";

export const metadata: Metadata = {
  title: "CampusAI - AI Powered TNEA Counselling",
  description:
    "Find your perfect engineering college with AI-powered TNEA counselling, cutoff analysis, and personalized recommendations.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="bg-black text-white antialiased">
        <Navbar />

        {children}

        <Footer />
      </body>
    </html>
  );
}