import { NextRequest, NextResponse } from "next/server";
import { getFeaturedColleges } from "@/lib/repositories/collegeRepository";

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const limit = Number(searchParams.get("limit") ?? "12");

    const colleges = await getFeaturedColleges(limit);

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