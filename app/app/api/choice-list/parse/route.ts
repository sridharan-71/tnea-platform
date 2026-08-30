import { PDFParse } from "pdf-parse";

import { parseChoiceListText } from "@/lib/choice-filling/parseChoiceList";
import { getCollegeNamesByCodes } from "@/lib/repositories/collegeRepository";
import { getActiveTneaOffers } from "@/lib/repositories/tnea2026Repository";

export const runtime = "nodejs";

const MAX_FILE_SIZE = 5 * 1024 * 1024;
const ALLOWED_TYPES = new Set(["application/pdf", "text/plain", "text/csv"]);

async function fileText(file: File) {
  if (file.type === "application/pdf" || file.name.toLowerCase().endsWith(".pdf")) {
    const parser = new PDFParse({ data: new Uint8Array(await file.arrayBuffer()) });
    try {
      const result = await parser.getText();
      return result.text;
    } finally {
      await parser.destroy();
    }
  }
  return file.text();
}

export async function POST(request: Request) {
  try {
    const formData = await request.formData();
    const file = formData.get("file");
    const pastedText = formData.get("text");
    let text = typeof pastedText === "string" ? pastedText.trim() : "";
    let sourceName = "Pasted choice list";

    if (file instanceof File && file.size > 0) {
      if (file.size > MAX_FILE_SIZE) {
        return Response.json({ error: "Choose a file smaller than 5 MB." }, { status: 413 });
      }
      const extensionAllowed = /\.(pdf|txt|csv)$/i.test(file.name);
      if (!ALLOWED_TYPES.has(file.type) && !extensionAllowed) {
        return Response.json({ error: "Upload a PDF, TXT or CSV choice list." }, { status: 415 });
      }
      text = await fileText(file);
      sourceName = file.name.slice(0, 120);
    }
    if (text.length < 8) {
      return Response.json({ error: "The uploaded file did not contain readable choice-list text." }, { status: 400 });
    }

    const offers = await getActiveTneaOffers();
    if (!offers) throw new Error("The active 2026 matrix is unavailable.");
    const detectedCodes = [...text.matchAll(/\b(\d{4})\b/g)].map((match) => Number(match[1]));
    const collegeNames = await getCollegeNamesByCodes(detectedCodes);
    const parsed = parseChoiceListText(text, offers, collegeNames);
    if (!parsed.choices.length) {
      return Response.json({
        error: "No college-code and branch-code pairs could be read. Try pasting the list as lines such as “2006 CS”.",
      }, { status: 422 });
    }

    return Response.json({
      ...parsed,
      sourceName,
      fileStored: false,
    });
  } catch (reason) {
    console.error("Choice-list parsing failed:", reason);
    return Response.json({
      error: "CampusAI could not read this file. Try exporting a text-based PDF or paste the choices.",
    }, { status: 400 });
  }
}
