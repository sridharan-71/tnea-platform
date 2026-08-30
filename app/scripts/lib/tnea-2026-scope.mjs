export const TNEA_ADMISSION_YEAR = 2026;
export const EXPECTED_TNEA_COLLEGE_COUNT = 418;
export const TNEA_SCOPE = "official_tnea_colleges_only";

export function assertTneaCollegeCount(actualCount, context) {
  if (actualCount !== EXPECTED_TNEA_COLLEGE_COUNT) {
    throw new Error(
      `${context}: expected ${EXPECTED_TNEA_COLLEGE_COUNT} official TNEA colleges `
      + `for ${TNEA_ADMISSION_YEAR}, received ${actualCount}. Refusing to continue.`,
    );
  }
}

export function assertTneaWebsiteAudit(audit) {
  if (
    audit?.summary?.scope !== TNEA_SCOPE
    || audit?.summary?.admissionYear !== TNEA_ADMISSION_YEAR
  ) {
    throw new Error(
      "The website audit is missing a verified TNEA 2026 scope. "
      + "Run `npm run data:audit-websites` before using this import.",
    );
  }

  assertTneaCollegeCount(audit.summary.total, "College website audit");

  if (!Array.isArray(audit.results) || audit.results.length !== audit.summary.total) {
    throw new Error("The college website audit is incomplete or malformed.");
  }
}
