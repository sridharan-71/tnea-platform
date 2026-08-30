# TNEA 2026 data update

This update keeps three different datasets separate:

1. `tnea_college_intakes` contains the official 2026 participating colleges, branches, and community seat matrix.
2. `tnea_merit_ranks` contains the official 2026 provisional student merit curve. Application numbers are excluded.
3. `rank_data` remains the historical college-and-branch closing-rank table. Do not insert the provisional student merit list into it.

The 2026 counselling closing ranks do not exist until counselling rounds produce allotment and cutoff results.

## Generate the import files

Run:

```bash
npm run data:import:tnea-2026
```

The command downloads and parses the official PDFs and writes files to `data/imports/tnea-2026/`.

## Apply the database migration

Run `supabase/migrations/20260721_001_tnea_2026_admission_data.sql` in the Supabase SQL editor or through the normal migration deployment workflow.

## Import the official college intake matrix

Run `data/imports/tnea-2026/tnea-2026-general-academic-seat-matrix.sql` in the Supabase SQL editor.

## Import the merit list

In the Supabase table editor, open `tnea_merit_ranks`, choose **Insert > Import data from CSV**, and import these files in order:

- `tnea-2026-general-academic-merit-ranks-part-01.csv`
- `tnea-2026-general-academic-merit-ranks-part-02.csv`
- `tnea-2026-general-academic-merit-ranks-part-03.csv`
- `tnea-2026-general-academic-merit-ranks-part-04.csv`
- `tnea-2026-general-academic-merit-ranks-part-05.csv`

The chunks are kept below 50,000 rows to make dashboard imports manageable.

## Placement data status

Run:

```bash
npm run audit:college-websites
npm run import:placements:official-sites
npm run import:placements:official-claims
```

The placement importer reads official NIRF disclosures. A disclosure published in 2026 normally contains completed academic-year data through 2024–25; it must not be relabelled as 2025–26 placement data. College-reported average and highest packages are only added when a verifiable official source explicitly supplies them.

The official-claims importer checks discovered placement pages and linked public documents for explicitly published placement percentages, average packages, and highest packages. Apply `supabase/migrations/20260721_002_placement_claim_evidence.sql` before importing `data/imports/official-placement-claims.sql`. Missing metrics remain null; the collector never fabricates a package or placement percentage.
