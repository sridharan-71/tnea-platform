alter table public.college_placement_statistics
  add column if not exists placement_percentage numeric(5, 2)
    check (placement_percentage is null or placement_percentage between 0 and 100),
  add column if not exists placement_percentage_source_url text,
  add column if not exists average_salary_source_url text,
  add column if not exists highest_salary_source_url text,
  add column if not exists source_confidence character varying(20)
    check (source_confidence is null or source_confidence in ('high', 'medium', 'low'));

comment on column public.college_placement_statistics.placement_percentage is
  'Directly published placement percentage. Keep separate from the rate calculated from students_placed / eligible_students.';

comment on column public.college_placement_statistics.source_confidence is
  'Confidence in the extracted source evidence, not a rating of the college.';

alter table public.college_facilities
  add column if not exists source_url text,
  add column if not exists last_verified_at timestamp with time zone;

alter table public.hostel_facilities
  add column if not exists source_url text,
  add column if not exists last_verified_at timestamp with time zone;
