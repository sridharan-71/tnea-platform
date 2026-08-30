# College evidence refresh

CampusAI keeps admission evidence separate from outcome and campus claims. Never replace a missing value with a fabricated number.

## Apply in Supabase

Run these files in this order in the Supabase SQL editor:

1. `supabase/migrations/20260721_002_placement_claim_evidence.sql`
2. `data/imports/official-placement-claims.sql`
3. `data/imports/official-campus-facts.sql`

The first file adds metric-specific evidence columns. The second imports published placement percentage, average package, and highest package claims from official college pages. The third imports official-page evidence for NAAC grades, hostel availability, and common campus facilities.

## Regenerate evidence

```bash
npm run audit:college-websites
npm run import:placements:official-sites
npm run import:placements:official-claims
npm run import:campus-facts:official
npm run audit:college-evidence
```

Generated reports:

- `data/imports/official-site-nirf-placements-report.json`
- `data/imports/official-placement-claims-report.json`
- `data/imports/official-campus-facts-report.json`
- `data/reports/college-evidence-coverage-2026.csv`
- `data/reports/college-evidence-coverage-2026.json`

## Verification policy

- TNEA cutoff, rank, branch, and college participation data come from official TNEA datasets.
- Median salary and placed/eligible counts come from official NIRF disclosures when available.
- Average package, highest package, and directly stated placement percentage are imported only when an official college page or linked public document publishes them.
- Automated website claims are marked medium confidence and retain a metric-specific source URL.
- A missing figure remains unavailable. It is not treated as zero and is never estimated without an explicit “CampusAI estimate” label.
