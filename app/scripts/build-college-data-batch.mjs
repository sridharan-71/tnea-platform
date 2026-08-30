import { readFile, writeFile } from "node:fs/promises";

import { assertTneaWebsiteAudit } from "./lib/tnea-2026-scope.mjs";

const sources = [
  "data/imports/official-site-nirf-placements.sql",
  "data/imports/college-official-links.sql",
  "data/imports/college-contact-candidates.sql",
  "data/imports/college-image-candidates.sql",
];

const audit = JSON.parse(
  await readFile("data/imports/college-website-audit.json", "utf8"),
);
assertTneaWebsiteAudit(audit);

const sections = await Promise.all(sources.map(async (source) => {
  const sql = await readFile(source, "utf8");
  return `-- Source: ${source}\n\n${sql.trim()}\n`;
}));

await writeFile(
  "data/imports/campusai-college-data-batch.sql",
  `-- CampusAI verified college-data batch\n-- Generated from official college websites and NIRF disclosures.\n\n${sections.join("\n")}`,
);

console.log("Created data/imports/campusai-college-data-batch.sql");
