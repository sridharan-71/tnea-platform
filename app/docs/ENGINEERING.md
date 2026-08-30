# CampusAI engineering guide

## Non-negotiable invariants

1. **2026 scope is fail-closed.** If the official `tnea_college_intakes` scope
   cannot be loaded, do not fall back to every historical college.
2. **Rank semantics stay separate from cutoff semantics.** General rank is
   compared with compatible OC/general closing-rank history. Community cutoff
   is the fallback only when general rank is absent.
3. **A student-selected branch is an eligibility boundary.** A prominent
   college must not be introduced through a branch the student did not select.
4. **One recommendation card means one college.** Branch-level rows are grouped
   only after each branch is classified. The representative acceptable branch
   controls the college’s displayed feasibility band.
5. **Quality does not alter feasibility.** The curated TNEA college order sorts
   colleges inside a band; it must never turn a Reach college into Safe.
6. **Unknown evidence stays unknown.** Missing hostel, accreditation, placement,
   or admission data must not be converted into a positive claim.
7. **No guarantee language.** “Very Safe” is a strict historical evidence band,
   not certainty.
8. **User input is untrusted.** Normalize API bodies and saved browser data at
   their boundaries. Do not expose database or provider errors to the browser.

## Request flow

```text
Student profile
  -> runtime validation
  -> selected active 2026 branches
  -> 2023–2025 rank/cutoff evidence
  -> branch feasibility bands
  -> one row per college
  -> Reach / Target / Safe / Very Safe
  -> college-strength ordering inside each band
  -> adaptive shortlist size
```

The recommendation endpoint owns server validation. Client validation improves
the experience but is never a security or correctness boundary.

## Authentication and saved state

- Browser authentication uses one singleton Supabase browser client.
- Server Components and Route Handlers use a request-scoped server client.
- `proxy.ts` refreshes and verifies authentication cookies.
- Local state is tagged with the authenticated user ID. Signing out clears
  student data from the device so the next account cannot inherit it.
- Profile and counselling progress have independent timestamps. This prevents a
  new edit in one section from overwriting a newer cloud edit in the other.
- A fresh authenticated user is loaded before each merge. Do not merge against
  stale session metadata.

The current cloud copy lives in Supabase user metadata to avoid requiring a
separate rollout migration. Before high-volume production use, move it to a
dedicated RLS-protected `student_states` table with optimistic concurrency. That
will provide stronger simultaneous-write handling and an audit trail.

## AI counsellor

The deterministic grounded response is always built first. Model output may
improve the wording of the answer but cannot replace the verified facts,
actions, cautions, or evidence returned by the deterministic layer.

- Keep `store: false`.
- Keep moderation and request timeouts.
- Send no student name or sensitive portal identifier to the model.
- Do not let the model generate a final college–branch choice-filling order.
- In a multi-instance deployment, replace the in-memory rate limiter with a
  shared store.

## Data changes

- Put schema changes in a new migration; do not edit an already-applied
  migration.
- Preserve source URL, retrieval date, admission year, and category semantics.
- Run the relevant audit script before and after an import.
- Never “resolve” conflicting duplicates by silently choosing one value.
- Update the cache key when the shape or meaning of cached data changes.

## Definition of done

- `npm run verify` succeeds.
- Desktop and phone layouts have no horizontal overflow.
- Browser console has no application errors.
- Invalid API input returns a safe 4xx response.
- Database/provider failure returns a generic user message and keeps details in
  server logs.
- Removed or paused features have no public route or orphaned import.
- Recommendation changes are tested with high, middle, and low ranks plus the
  no-rank cutoff fallback.
