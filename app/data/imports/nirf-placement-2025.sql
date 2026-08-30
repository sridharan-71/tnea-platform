begin;

insert into public.college_placement_statistics (
  college_id, academic_year, program_level,
  eligible_students, students_placed, students_higher_studies,
  median_salary, average_salary, highest_salary,
  source_type, is_self_reported, source_url, last_verified_at
)
values
(
    247, '2023-24', 'ug',
    803, 624, 155,
    860000, null, null,
    'nirf_disclosure', true, 'https://www.nirfindia.org/nirfpdfcdn/2025/pdf/Engineering/IR-E-C-16604.pdf', now()
  ),
(
    322, '2023-24', 'ug',
    1114, 831, 83,
    700000, null, null,
    'nirf_disclosure', true, 'https://www.nirfindia.org/nirfpdfcdn/2025/pdf/Engineering/IR-E-C-37013.pdf', now()
  ),
(
    421, '2023-24', 'ug',
    1084, 991, 92,
    700000, null, null,
    'nirf_disclosure', true, 'https://www.nirfindia.org/nirfpdfcdn/2025/pdf/Engineering/IR-E-C-36995.pdf', now()
  )
on conflict (college_id, academic_year, program_level) do update set
  eligible_students = excluded.eligible_students,
  students_placed = excluded.students_placed,
  students_higher_studies = excluded.students_higher_studies,
  median_salary = excluded.median_salary,
  source_type = excluded.source_type,
  is_self_reported = excluded.is_self_reported,
  source_url = excluded.source_url,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;
