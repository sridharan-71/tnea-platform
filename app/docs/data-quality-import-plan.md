# CampusAI college-quality import plan

This plan extends the current database. It reuses `colleges`,
`branch_accreditations`, `college_images`, `college_contacts`,
`college_facilities`, `hostel_facilities`, and `college_audit`.

The compatibility migration adds only `college_nirf_rankings`,
`college_accreditations`, `college_official_links`, and
`college_placement_statistics`. It also adds evidence fields to the existing
branch accreditation and image tables.

## Import order

1. Run `supabase/migrations/20260720_001_college_quality_foundation.sql`.
2. Match every source record to the existing `colleges.college_id`.
3. Import official NIRF Engineering records into `college_nirf_rankings`.
4. Review institution-name matches before committing ambiguous records.
5. Import verified official domains.
6. Import NAAC institution accreditation.
7. Import UGC autonomy and Anna University affiliation.
8. Import NBA program accreditation.
9. Import placement outcomes from official disclosures.

## Matching policy

- `colleges.college_id` is the internal relational identifier.
- `colleges.college_code` remains the public TNEA counselling identifier.
- Exact counselling-code matches are accepted automatically.
- Name-only matches must include location evidence.
- Ambiguous campuses remain in a review queue.
- Rank bands must never be converted into exact ranks.
- Missing NIRF data means `not listed`, not `poor quality`.
- Expired accreditation is stored historically but never shown as current.

## Source policy

Every imported fact must store its official source URL, source year or validity
period, and `last_verified_at`. College-site claims are marked self-reported.
Images are stored only when their usage status is approved; otherwise CampusAI
links to the official source or renders a neutral placeholder.
