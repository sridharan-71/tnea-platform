begin;

with default_system as (
  select counselling_system_id
  from public.colleges
  group by counselling_system_id
  order by count(*) desc
  limit 1
),
missing_colleges (college_code, college_name) as (
  values
    ('1102', 'Bhajarang Engineering College'),
    ('1111', 'Rajalakshmi Engineering College (Off Campus)'),
    ('1203', 'Madras Engineering College'),
    ('1339', 'Mahalakshmi Tech Campus'),
    ('2323', 'Dhanalakshmi Srinivasan College of Engineering and Technology (Autonomous Tiruppur Campus)'),
    ('2378', 'Cheran College of Technology'),
    ('2777', 'Hindusthan College of Engineering'),
    ('3477', 'Sri Vignesh College of Engineering and Technology'),
    ('3555', 'Ayyappa Engineering College'),
    ('4747', 'S. Thangapazham College of Engineering and Technology'),
    ('4911', 'Sree Krishna College of Engineering and Technology - New Institution'),
    ('4986', 'Noorul Islam College of Engineering and Technology'),
    ('5545', 'G.T.N College of Technology'),
    ('5546', 'Jamal Mohamed College of Engineering')
)
insert into public.colleges (
  counselling_system_id,
  college_code,
  college_name,
  is_active
)
select
  default_system.counselling_system_id,
  missing_colleges.college_code,
  missing_colleges.college_name,
  true
from missing_colleges
cross join default_system
where not exists (
  select 1
  from public.colleges existing
  where existing.college_code = missing_colleges.college_code
);

commit;
