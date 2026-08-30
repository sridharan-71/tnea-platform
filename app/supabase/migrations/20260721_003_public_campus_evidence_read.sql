begin;

alter table public.college_facilities enable row level security;
alter table public.hostel_facilities enable row level security;

drop policy if exists "Public can read college facilities" on public.college_facilities;
create policy "Public can read college facilities"
  on public.college_facilities
  for select
  using (true);

drop policy if exists "Public can read hostel facilities" on public.hostel_facilities;
create policy "Public can read hostel facilities"
  on public.hostel_facilities
  for select
  using (true);

commit;
