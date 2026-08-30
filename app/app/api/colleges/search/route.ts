import { NextRequest, NextResponse } from "next/server";
import {
  getFeaturedColleges,
  searchColleges,
} from "@/lib/repositories/collegeRepository";

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;

    const query = (searchParams.get("q")?.trim() ?? "").slice(0, 80);
    const requestedLimit = Number(searchParams.get("limit") ?? "10");
    const limit = Number.isFinite(requestedLimit)
      ? Math.max(1, Math.min(20, Math.floor(requestedLimit)))
      : 10;

    const colleges =
      query.length > 0
        ? await searchColleges(query, limit)
        : await getFeaturedColleges(limit);

    return NextResponse.json({
      success: true,
      data: colleges,
    });
  } catch (error) {
    console.error("College search failed:", error);
    return NextResponse.json(
      {
        success: false,
        error: "College search is temporarily unavailable.",
      },
      {
        status: 500,
      }
    );
  }
}
