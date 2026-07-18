import { NextRequest, NextResponse } from "next/server";
import {
  getFeaturedColleges,
  searchColleges,
} from "@/lib/repositories/collegeRepository";

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;

    const query = searchParams.get("q")?.trim() ?? "";
    const limit = Number(searchParams.get("limit") ?? "10");

    const colleges =
      query.length > 0
        ? await searchColleges(query, limit)
        : await getFeaturedColleges(limit);

    return NextResponse.json({
      success: true,
      data: colleges,
    });
  } catch (error) {
    return NextResponse.json(
      {
        success: false,
        error:
          error instanceof Error
            ? error.message
            : "Internal Server Error",
      },
      {
        status: 500,
      }
    );
  }
}