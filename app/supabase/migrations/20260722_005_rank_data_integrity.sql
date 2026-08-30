begin;

-- Refuse cleanup if duplicate keys disagree. Conflicts require manual review;
-- this migration must never choose one rank value silently.
do $$
begin
  if exists (
    select 1
    from public.rank_data
    where year in (2023, 2024, 2025)
    group by year, college_code, branch_code
    having count(*) > 1
       and count(distinct jsonb_build_array(oc, bc, bcm, mbc, sc, sca, st)) > 1
  ) then
    raise exception 'Conflicting duplicate rank_data rows exist; run the rank-data audit and resolve them manually.';
  end if;
end $$;

-- The 2023-2025 audit found every key duplicated exactly once with identical
-- category values. Retain one physical row per logical key.
with duplicates as (
  select ctid,
         row_number() over (
           partition by year, college_code, branch_code
           order by ctid
         ) as occurrence
  from public.rank_data
  where year in (2023, 2024, 2025)
)
delete from public.rank_data ranks
using duplicates
where ranks.ctid = duplicates.ctid
  and duplicates.occurrence > 1;

create unique index if not exists rank_data_year_college_branch_unique_idx
  on public.rank_data (year, college_code, branch_code);

alter table public.rank_data
  add column if not exists source_url text,
  add column if not exists source_retrieved_at timestamp with time zone,
  add column if not exists round_semantics character varying(20) default 'unknown'
    check (round_semantics in ('round1', 'final', 'aggregate', 'unknown'));

comment on column public.rank_data.source_url is
  'Official source document for the category closing-rank row.';
comment on column public.rank_data.round_semantics is
  'Meaning of the stored closing rank. Unknown values must cap recommendation confidence.';

commit;
