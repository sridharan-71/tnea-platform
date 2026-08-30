/**
 * A stable, TNEA-only college preference order for recommendation display.
 *
 * This is deliberately separate from admission feasibility. It is a curated
 * CampusAI order based on sustained TNEA demand and established institutional
 * standing; it is not presented as an official government ranking. Colleges
 * outside this list fall back to their recent admission-demand signal.
 */
const PRIORITY_ALIASES = [
  ["college of engineering guindy", "ceg campus"],
  ["madras institute of technology", "mit campus"],
  ["psg college of technology"],
  ["coimbatore institute of technology"],
  ["thiagarajar college of engineering"],
  ["government college of technology"],
  ["psg institute of technology and applied research"],
  ["chennai institute of technology"],
  ["rajalakshmi engineering college"],
  ["kumaraguru college of technology"],
  ["sri eshwar college of engineering"],
  ["sri krishna college of engineering and technology"],
  ["easwari engineering college"],
  ["bannari amman institute of technology"],
  ["kpr institute of engineering and technology"],
  ["rajalakshmi institute of technology"],
  ["saveetha engineering college"],
  ["kalaignarkarunanidhi institute of technology"],
  ["mepco schlenk engineering college"],
  ["loyola icam college of engineering and technology"],
  ["r m k engineering college", "rmk engineering college"],
  ["r m d engineering college", "rmd engineering college"],
  ["sri ramakrishna engineering college"],
  ["kongu engineering college"],
  ["sri venkateswara college of engineering"],
  ["sri sairam engineering college", "sri sai ram engineering college"],
  ["st josephs college of engineering", "st joseph's college of engineering"],
  ["karpagam college of engineering"],
  ["dr mahalingam college of engineering and technology"],
  ["sona college of technology"],
  ["psna college of engineering and technology"],
  ["vsb engineering college"],
  ["panimalar engineering college"],
  ["government college of engineering salem"],
  ["government college of engineering tirunelveli"],
  ["government college of engineering erode", "institute of road and transport technology"],
  ["government college of engineering bargur"],
  ["alagappa chettiar government college"],
  ["thanthai periyar government institute of technology"],
  ["anna university regional campus coimbatore"],
] as const;

function normalize(value: string) {
  return value.toLowerCase().replace(/[^a-z0-9]+/g, " ").trim();
}

export function tneaOverallPriority(collegeName: string): number | null {
  const normalized = normalize(collegeName);
  const index = PRIORITY_ALIASES.findIndex((aliases) =>
    aliases.some((alias) => normalized.includes(normalize(alias))),
  );
  return index === -1 ? null : index + 1;
}
