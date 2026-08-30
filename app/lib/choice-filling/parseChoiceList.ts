import type { TneaActiveOffer } from "@/lib/repositories/tnea2026Repository";
import type { ParsedChoice } from "./types";

interface ParseResult {
  choices: ParsedChoice[];
  unmatchedLines: number;
  textLength: number;
}

function cleanLine(value: string) {
  return value.replace(/\s+/g, " ").trim();
}

function likelyBranchTokens(value: string) {
  return value.toUpperCase().match(/\b[A-Z][A-Z0-9]{1,3}\b/g) ?? [];
}

export function parseChoiceListText(
  text: string,
  offers: Map<string, TneaActiveOffer>,
  collegeNames: Map<number, string>,
): ParseResult {
  const activeCodes = new Set([...offers.values()].map((offer) => Number(offer.collegeCode)));
  const branchCodes = new Set([...offers.values()].map((offer) => offer.branchCode.toUpperCase()));
  const lines = text.split(/\r?\n/).map(cleanLine).filter(Boolean);
  const choices: ParsedChoice[] = [];
  let unmatchedLines = 0;

  for (let index = 0; index < lines.length; index += 1) {
    const line = lines[index];
    const context = cleanLine(`${line} ${lines[index + 1] ?? ""}`);
    const codes = [...line.matchAll(/\b(\d{4})\b/g)].map((match) => Number(match[1]));
    const collegeCode = codes.find((code) => activeCodes.has(code)) ?? codes[0];
    if (!collegeCode) continue;

    const tokens = likelyBranchTokens(context);
    const validBranch = tokens.find((token) => offers.has(`${collegeCode}-${token}`));
    const fallbackBranch = tokens.find((token) => branchCodes.has(token)) ?? "";
    const branchCode = validBranch ?? fallbackBranch;
    if (!branchCode) {
      unmatchedLines += 1;
      continue;
    }

    const offer = offers.get(`${collegeCode}-${branchCode}`);
    choices.push({
      position: choices.length + 1,
      collegeCode,
      collegeName: collegeNames.get(collegeCode) ?? `College code ${collegeCode}`,
      branchCode,
      branchName: offer?.branchName ?? branchCode,
      valid2026: Boolean(offer),
      duplicate: false,
      rawLine: line.slice(0, 240),
    });
  }

  const seen = new Set<string>();
  const deduplicated = choices.map((choice) => {
    const key = `${choice.collegeCode}-${choice.branchCode}`;
    const duplicate = seen.has(key);
    seen.add(key);
    return { ...choice, duplicate };
  });

  return {
    choices: deduplicated,
    unmatchedLines,
    textLength: text.length,
  };
}
