# CampusAI

CampusAI is a decision-support product for students taking part in TNEA 2026.
It combines a personal admission profile, college-only recommendations, an
official-process counselling tracker, and a grounded AI counsellor.

## Product boundaries

- Only colleges and branches in the official 2026 TNEA intake table are shown.
- General rank is the primary admission-feasibility input. Community cutoff is
  used only when rank is unavailable.
- Recommendations contain one card per college. Branches are evidence inputs,
  not choice-filling output.
- Reach, Target, Safe, and Very Safe describe historical evidence. None is a
  guarantee of a 2026 allotment.
- Placement packages are intentionally excluded until complete, verified data
  is available.
- CampusAI never asks for a TNEA password, OTP, application number, Aadhaar
  number, certificate, or payment detail.

The detailed engineering rules are in
[`docs/ENGINEERING.md`](docs/ENGINEERING.md).

## Local setup

1. Install Node.js and run `npm install`.
2. Copy `.env.example` to `.env.local` and add the Supabase public values.
3. Run `npm run dev`.
4. Open [http://localhost:3000](http://localhost:3000).

`OPENAI_API_KEY` is optional. Without it, the counsellor uses the deterministic,
verified reasoning path.

## Required checks

Run this before handing work to another contributor:

```bash
npm run verify
```

It performs linting, strict TypeScript validation, and a production build.

## Main areas

- `app/` — pages and server endpoints
- `components/` — product UI grouped by feature
- `lib/recommendations/` — feasibility classification and college grouping
- `lib/repositories/` — all database reads
- `lib/counselling/` — verified process content and schedules
- `lib/account/` — local and signed-in state synchronization
- `supabase/migrations/` — reviewed database schema changes
- `scripts/` — explicit data imports and audits
- `docs/` — engineering and data-maintenance procedures

Data imports are never part of application startup. Run them deliberately,
review their audit output, and keep provenance with every imported fact.
