begin;

insert into public.college_placement_statistics (
  college_id, academic_year, program_level,
  placement_percentage, average_salary, highest_salary,
  placement_percentage_source_url, average_salary_source_url, highest_salary_source_url,
  source_type, is_self_reported, source_url, source_confidence, last_verified_at
)
values
(
    183, 'latest-published', 'ug',
    null, 420000, 2200000,
    null, 'https://www.rmd.ac.in/placement/placement.html', 'https://www.rmd.ac.in/placement/placement.html',
    'official_website_claim', true, 'https://www.rmd.ac.in/placement/placement.html',
    'medium', now()
  ),
(
    184, 'latest-published', 'ug',
    85, 507000, 2500000,
    'https://www.rmkec.ac.in/2023/administration/dean/', 'https://www.rmkec.ac.in/2023/training_placement/about-training-and-placement/', 'https://www.rmkec.ac.in/2023/training_placement/about-training-and-placement/',
    'official_website_claim', true, 'https://www.rmkec.ac.in/2023/training_placement/about-training-and-placement/',
    'medium', now()
  ),
(
    185, 'latest-published', 'ug',
    82, null, null,
    'https://www.saec.ac.in/placement.php', null, null,
    'official_website_claim', true, 'https://www.saec.ac.in/placement.php',
    'medium', now()
  ),
(
    187, 'latest-published', 'ug',
    null, 300000, null,
    null, 'https://www.sriventech.ac.in/', null,
    'official_website_claim', true, 'https://www.sriventech.ac.in/',
    'medium', now()
  ),
(
    188, 'latest-published', 'ug',
    90, null, null,
    'https://www.veltechmultitech.org/placements/', null, null,
    'official_website_claim', true, 'https://www.veltechmultitech.org/placements/',
    'medium', now()
  ),
(
    197, 'latest-published', 'ug',
    null, null, 6600000,
    null, null, 'https://www.rmkcet.ac.in/',
    'official_website_claim', true, 'https://www.rmkcet.ac.in/',
    'medium', now()
  ),
(
    203, 'latest-published', 'ug',
    95, null, null,
    'https://amcet.in/', null, null,
    'official_website_claim', true, 'https://amcet.in/',
    'medium', now()
  ),
(
    212, 'latest-published', 'ug',
    100, null, null,
    'https://www.caad.ac.in/', null, null,
    'official_website_claim', true, 'https://www.caad.ac.in/',
    'medium', now()
  ),
(
    214, 'latest-published', 'ug',
    null, 450000, 450000,
    null, 'https://www.kingsedu.ac.in/placements/', 'https://www.kingsedu.ac.in/placements/',
    'official_website_claim', true, 'https://www.kingsedu.ac.in/placements/',
    'medium', now()
  ),
(
    216, 'latest-published', 'ug',
    null, null, 1500000,
    null, null, 'https://www.panimalar.ac.in/placement.php',
    'official_website_claim', true, 'https://www.panimalar.ac.in/placement.php',
    'medium', now()
  ),
(
    218, 'latest-published', 'ug',
    100, null, null,
    'https://rgei.ac.in/', null, null,
    'official_website_claim', true, 'https://rgei.ac.in/',
    'medium', now()
  ),
(
    220, 'latest-published', 'ug',
    97, 536000, 4400000,
    'https://saveetha.ac.in/placement/', 'https://saveetha.ac.in/placement/', 'https://saveetha.ac.in/placement/',
    'official_website_claim', true, 'https://saveetha.ac.in/placement/',
    'medium', now()
  ),
(
    221, 'latest-published', 'ug',
    92, null, 2200000,
    'https://sasthainstitutions.in/placements/', null, 'https://sasthainstitutions.in/',
    'official_website_claim', true, 'https://sasthainstitutions.in/',
    'medium', now()
  ),
(
    222, 'latest-published', 'ug',
    null, null, 450000,
    null, null, 'https://smit.edu.in/placement/',
    'official_website_claim', true, 'https://smit.edu.in/placement/',
    'medium', now()
  ),
(
    223, 'latest-published', 'ug',
    null, 700000, 4700000,
    null, 'https://www.svce.ac.in/', 'https://www.svce.ac.in/',
    'official_website_claim', true, 'https://www.svce.ac.in/',
    'medium', now()
  ),
(
    232, 'latest-published', 'ug',
    null, null, 900000,
    null, null, 'https://www.adhi.edu.in/',
    'official_website_claim', true, 'https://www.adhi.edu.in/',
    'medium', now()
  ),
(
    238, 'latest-published', 'ug',
    null, 320000, 600000,
    null, 'https://www.msajce-edu.in/uploads/aqar/AnnualReport2023-2024.pdf', 'https://www.msajce-edu.in/uploads/aqar/AnnualReport2023-2024.pdf',
    'official_website_claim', true, 'https://www.msajce-edu.in/uploads/aqar/AnnualReport2023-2024.pdf',
    'medium', now()
  ),
(
    242, 'latest-published', 'ug',
    null, null, 1200000,
    null, null, 'https://jerusalemengg.ac.in/placement/index.php',
    'official_website_claim', true, 'https://jerusalemengg.ac.in/placement/index.php',
    'medium', now()
  ),
(
    243, 'latest-published', 'ug',
    null, null, 1800000,
    null, null, 'https://msec.edu.in/placement%20brochure.pdf',
    'official_website_claim', true, 'https://msec.edu.in/placement%20brochure.pdf',
    'medium', now()
  ),
(
    254, 'latest-published', 'ug',
    84.38, null, null,
    'https://sairamit.edu.in/placement-statistics/', null, null,
    'official_website_claim', true, 'https://sairamit.edu.in/placement-statistics/',
    'medium', now()
  ),
(
    255, 'latest-published', 'ug',
    null, 700000, 700000,
    null, 'https://www.stjoseph.ac.in/placement1.php', 'https://www.stjoseph.ac.in/placement1.php',
    'official_website_claim', true, 'https://www.stjoseph.ac.in/placement1.php',
    'medium', now()
  ),
(
    264, 'latest-published', 'ug',
    null, 5000000, null,
    null, 'https://dce.edu.in/admissions-dce/', null,
    'official_website_claim', true, 'https://dce.edu.in/admissions-dce/',
    'medium', now()
  ),
(
    269, 'latest-published', 'ug',
    null, 3300000, 3300000,
    null, 'https://mailamengg.ac.in/placements/', 'https://mailamengg.ac.in/placements/',
    'official_website_claim', true, 'https://mailamengg.ac.in/placements/',
    'medium', now()
  ),
(
    270, 'latest-published', 'ug',
    null, null, 3200000,
    null, null, 'https://www.svct.edu.in/placements',
    'official_website_claim', true, 'https://www.svct.edu.in/placements',
    'medium', now()
  ),
(
    273, 'latest-published', 'ug',
    95, null, null,
    'https://www.sakthiec.edu.in/', null, null,
    'official_website_claim', true, 'https://www.sakthiec.edu.in/',
    'medium', now()
  ),
(
    277, 'latest-published', 'ug',
    88, null, null,
    'https://srmvalliammai.ac.in/placement/', null, null,
    'official_website_claim', true, 'https://srmvalliammai.ac.in/placement/',
    'medium', now()
  ),
(
    285, 'latest-published', 'ug',
    25, null, null,
    'https://ritchennai.org/placement-why-rit.php', null, null,
    'official_website_claim', true, 'https://ritchennai.org/placement-why-rit.php',
    'medium', now()
  ),
(
    290, 'latest-published', 'ug',
    95.3, null, null,
    'https://www.aktmcet.in/', null, null,
    'official_website_claim', true, 'https://www.aktmcet.in/',
    'medium', now()
  ),
(
    297, 'latest-published', 'ug',
    null, 240000, null,
    null, 'https://www.apce.in/placement-training.php', null,
    'official_website_claim', true, 'https://www.apce.in/placement-training.php',
    'medium', now()
  ),
(
    323, 'latest-published', 'ug',
    null, null, 1540000,
    null, null, 'https://cit.edu.in/placements/placement-records',
    'official_website_claim', true, 'https://cit.edu.in/placements/placement-records',
    'medium', now()
  ),
(
    329, 'latest-published', 'ug',
    null, 450000, 4100000,
    null, 'https://rtc.ac.in/', 'https://rtc.ac.in/',
    'official_website_claim', true, 'https://rtc.ac.in/',
    'medium', now()
  ),
(
    333, 'latest-published', 'ug',
    null, null, 500000,
    null, null, 'https://sriet.ac.in/wp-content/uploads/2025/02/placed.pdf',
    'official_website_claim', true, 'https://sriet.ac.in/wp-content/uploads/2025/02/placed.pdf',
    'medium', now()
  ),
(
    344, 'latest-published', 'ug',
    null, 460000, 450000,
    null, 'https://vsbcetc.edu.in/placement-details/', 'https://vsbcetc.edu.in/placement-details/',
    'official_website_claim', true, 'https://vsbcetc.edu.in/placement-details/',
    'medium', now()
  ),
(
    360, 'latest-published', 'ug',
    85, null, null,
    'https://ksrct.ac.in/training-placement.php', null, null,
    'official_website_claim', true, 'https://ksrct.ac.in/training-placement.php',
    'medium', now()
  ),
(
    361, 'latest-published', 'ug',
    null, null, 680000,
    null, null, 'https://www.mkce.ac.in/placement',
    'official_website_claim', true, 'https://www.mkce.ac.in/placement',
    'medium', now()
  ),
(
    372, 'latest-published', 'ug',
    null, 280000, null,
    null, 'https://www.vcenggw.ac.in/placement.php', null,
    'official_website_claim', true, 'https://www.vcenggw.ac.in/placement.php',
    'medium', now()
  ),
(
    374, 'latest-published', 'ug',
    null, 750000, 4700000,
    null, 'https://vsbec.edu.in/placements/', 'https://vsbec.edu.in/placements/',
    'official_website_claim', true, 'https://vsbec.edu.in/placements/',
    'medium', now()
  ),
(
    380, 'latest-published', 'ug',
    null, null, 200000,
    null, null, 'https://www.chettinadtech.ac.in/assets/pdf/MandatoryDisclosure26.pdf',
    'official_website_claim', true, 'https://www.chettinadtech.ac.in/assets/pdf/MandatoryDisclosure26.pdf',
    'medium', now()
  ),
(
    383, 'latest-published', 'ug',
    null, 320000, 800000,
    null, 'https://excelinstitutions.com/placement-day-2026-campus-to-corporate/', 'https://excelinstitutions.com/placement-day-2026-campus-to-corporate/',
    'official_website_claim', true, 'https://excelinstitutions.com/placement-day-2026-campus-to-corporate/',
    'medium', now()
  ),
(
    393, 'latest-published', 'ug',
    95, 1200000, 450000,
    'https://placements.jkkn.ac.in/', 'https://placements.jkkn.ac.in/', 'https://placements.jkkn.ac.in/',
    'official_website_claim', true, 'https://placements.jkkn.ac.in/',
    'medium', now()
  ),
(
    400, 'latest-published', 'ug',
    90, null, null,
    'https://www.vsagroup.ac.in/', null, null,
    'official_website_claim', true, 'https://www.vsagroup.ac.in/',
    'medium', now()
  ),
(
    405, 'latest-published', 'ug',
    null, 500000, 1400000,
    null, 'https://www.sreesakthi.edu.in/assets/documents/Annual-Report.pdf', 'https://www.sreesakthi.edu.in/assets/documents/Annual-Report.pdf',
    'official_website_claim', true, 'https://www.sreesakthi.edu.in/assets/documents/Annual-Report.pdf',
    'medium', now()
  ),
(
    407, 'latest-published', 'ug',
    null, null, 4400000,
    null, null, 'https://www.bitsathy.ac.in/placement/',
    'official_website_claim', true, 'https://www.bitsathy.ac.in/placement/',
    'medium', now()
  ),
(
    408, 'latest-published', 'ug',
    null, 800000, null,
    null, 'https://www.cietcbe.edu.in/placements', null,
    'official_website_claim', true, 'https://www.cietcbe.edu.in/placements',
    'medium', now()
  ),
(
    414, 'latest-published', 'ug',
    null, null, 450000,
    null, null, 'https://kce.ac.in/placement-overview',
    'official_website_claim', true, 'https://kce.ac.in/placement-overview',
    'medium', now()
  ),
(
    416, 'latest-published', 'ug',
    null, 580000, null,
    null, 'https://kct.ac.in/wp-content/uploads/2024/07/KCT_Annual-Report-23.pdf', null,
    'official_website_claim', true, 'https://kct.ac.in/wp-content/uploads/2024/07/KCT_Annual-Report-23.pdf',
    'medium', now()
  ),
(
    418, 'latest-published', 'ug',
    null, null, 4400000,
    null, null, 'https://nandhaengg.org/placement/',
    'official_website_claim', true, 'https://nandhaengg.org/placement/',
    'medium', now()
  ),
(
    424, 'latest-published', 'ug',
    null, null, 4400000,
    null, null, 'https://skct.edu.in/placement/placement-cell/',
    'official_website_claim', true, 'https://skct.edu.in/placement/placement-cell/',
    'medium', now()
  ),
(
    425, 'latest-published', 'ug',
    85, null, 900000,
    'https://www.velalarengg.ac.in/', null, 'https://www.velalarengg.ac.in/',
    'official_website_claim', true, 'https://www.velalarengg.ac.in/',
    'medium', now()
  ),
(
    427, 'latest-published', 'ug',
    86, null, 5300000,
    'https://snsct.org/', null, 'https://snsct.org/',
    'official_website_claim', true, 'https://snsct.org/',
    'medium', now()
  ),
(
    430, 'latest-published', 'ug',
    null, null, 1800000,
    null, null, 'https://www.nehrucolleges.org/',
    'official_website_claim', true, 'https://www.nehrucolleges.org/',
    'medium', now()
  ),
(
    448, 'latest-published', 'ug',
    95, null, null,
    'https://www.kgkite.ac.in/', null, null,
    'official_website_claim', true, 'https://www.kgkite.ac.in/',
    'medium', now()
  ),
(
    457, 'latest-published', 'ug',
    null, null, 650000,
    null, null, 'https://kpriet.ac.in/career-development-centre',
    'official_website_claim', true, 'https://kpriet.ac.in/career-development-centre',
    'medium', now()
  ),
(
    460, 'latest-published', 'ug',
    98, 900000, 900000,
    'https://www.jct.ac.in/', 'https://www.jct.ac.in/', 'https://www.jct.ac.in/',
    'official_website_claim', true, 'https://www.jct.ac.in/',
    'medium', now()
  ),
(
    469, 'latest-published', 'ug',
    70, null, null,
    'https://www.ucep.edu.in/', null, null,
    'official_website_claim', true, 'https://www.ucep.edu.in/',
    'medium', now()
  ),
(
    485, 'latest-published', 'ug',
    82.11, null, 850000,
    'https://krct.ac.in/placements/statistics/', null, 'https://krct.ac.in/placements/statistics/',
    'official_website_claim', true, 'https://krct.ac.in/placements/statistics/',
    'medium', now()
  ),
(
    496, 'latest-published', 'ug',
    90, null, null,
    'https://aec.org.in/placement-details-2024/', null, null,
    'official_website_claim', true, 'https://aec.org.in/placement-details-2024/',
    'medium', now()
  ),
(
    498, 'latest-published', 'ug',
    100, null, 1000000,
    'https://www.egspec.org/placements', null, 'https://www.egspec.org/',
    'official_website_claim', true, 'https://www.egspec.org/',
    'medium', now()
  ),
(
    502, 'latest-published', 'ug',
    null, 1000000, 500000,
    null, 'https://www.mamce.org/placement', 'https://www.mamce.org/placement',
    'official_website_claim', true, 'https://www.mamce.org/placement',
    'medium', now()
  ),
(
    515, 'latest-published', 'ug',
    100, null, 1000000,
    'https://mamcet.com/placement/', null, 'https://mamcet.com/placement/',
    'official_website_claim', true, 'https://mamcet.com/placement/',
    'medium', now()
  ),
(
    515, '2024-25', 'ug',
    90, 300000, null,
    'http://mamcet.com/wp-content/uploads/2025/10/ANNUAL-REPORT-2024-2025-1.pdf', 'http://mamcet.com/wp-content/uploads/2025/10/ANNUAL-REPORT-2024-2025-1.pdf', null,
    'official_website_claim', true, 'http://mamcet.com/wp-content/uploads/2025/10/ANNUAL-REPORT-2024-2025-1.pdf',
    'medium', now()
  ),
(
    517, 'latest-published', 'ug',
    null, 550000, 550000,
    null, 'https://www.igceng.com/index.html', 'https://www.igceng.com/index.html',
    'official_website_claim', true, 'https://www.igceng.com/index.html',
    'medium', now()
  ),
(
    525, 'latest-published', 'ug',
    85, 540000, 540000,
    'https://www.annaiengg.org/placements.php', 'https://www.annaiengg.org/top-recruiters.php', 'https://www.annaiengg.org/top-recruiters.php',
    'official_website_claim', true, 'https://www.annaiengg.org/top-recruiters.php',
    'medium', now()
  ),
(
    534, 'latest-published', 'ug',
    57.46, null, null,
    'https://www.mzcet.in/placement.html', null, null,
    'official_website_claim', true, 'https://www.mzcet.in/placement.html',
    'medium', now()
  ),
(
    562, 'latest-published', 'ug',
    100, 450000, 450000,
    'https://www.holycrossengineeringcollege.com/admission-register.html', 'https://www.holycrossengineeringcollege.com/placement.php.html', 'https://www.holycrossengineeringcollege.com/placement.php.html',
    'official_website_claim', true, 'https://www.holycrossengineeringcollege.com/placement.php.html',
    'medium', now()
  ),
(
    571, 'latest-published', 'ug',
    98, null, null,
    'https://www.csiit.ac.in/', null, null,
    'official_website_claim', true, 'https://www.csiit.ac.in/',
    'medium', now()
  ),
(
    572, 'latest-published', 'ug',
    null, 850000, 850000,
    null, 'https://www.capeitech.org/', 'https://www.capeitech.org/',
    'official_website_claim', true, 'https://www.capeitech.org/',
    'medium', now()
  ),
(
    574, 'latest-published', 'ug',
    null, null, 1300000,
    null, null, 'https://www.francisxavier.ac.in/placements',
    'official_website_claim', true, 'https://www.francisxavier.ac.in/placements',
    'medium', now()
  ),
(
    577, 'latest-published', 'ug',
    null, 2400000, 350000,
    null, 'https://www.kamarajengg.edu.in/tdpc', 'https://www.kamarajengg.edu.in/tdpc',
    'official_website_claim', true, 'https://www.kamarajengg.edu.in/tdpc',
    'medium', now()
  ),
(
    582, 'latest-published', 'ug',
    null, null, 2700000,
    null, null, 'https://psr.edu.in/',
    'official_website_claim', true, 'https://psr.edu.in/',
    'medium', now()
  ),
(
    587, 'latest-published', 'ug',
    null, null, 450000,
    null, null, 'https://www.sowdambikaengg.edu.in/depts/patssce/index.html',
    'official_website_claim', true, 'https://www.sowdambikaengg.edu.in/depts/patssce/index.html',
    'medium', now()
  ),
(
    590, 'latest-published', 'ug',
    80, null, null,
    'https://www.gcetly.ac.in/', null, null,
    'official_website_claim', true, 'https://www.gcetly.ac.in/',
    'medium', now()
  ),
(
    602, 'latest-published', 'ug',
    null, null, 700000,
    null, null, 'http://bethlahem.org/engineering/frontend/web/index.php/main/index',
    'official_website_claim', true, 'http://bethlahem.org/engineering/frontend/web/index.php/main/index',
    'medium', now()
  ),
(
    603, 'latest-published', 'ug',
    null, null, 460000,
    null, null, 'https://www.lites.edu.in/',
    'official_website_claim', true, 'https://www.lites.edu.in/',
    'medium', now()
  ),
(
    609, 'latest-published', 'ug',
    null, 750000, 4500000,
    null, 'https://www.tce.edu/cdc/placement-statistics', 'https://www.tce.edu/cdc/placement-statistics',
    'official_website_claim', true, 'https://www.tce.edu/cdc/placement-statistics',
    'medium', now()
  ),
(
    630, 'latest-published', 'ug',
    89, null, 1900000,
    'https://www.nscet.org/placement/', null, 'https://www.nscet.org/placement/',
    'official_website_claim', true, 'https://www.nscet.org/placement/',
    'medium', now()
  ),
(
    641, 'latest-published', 'ug',
    null, null, 800000,
    null, null, 'https://www.smcet.edu.in/placements/',
    'official_website_claim', true, 'https://www.smcet.edu.in/placements/',
    'medium', now()
  ),
(
    647, 'latest-published', 'ug',
    null, null, 4700000,
    null, null, 'https://www.vcet.ac.in/',
    'official_website_claim', true, 'https://www.vcet.ac.in/',
    'medium', now()
  )
on conflict (college_id, academic_year, program_level) do update set
  placement_percentage = coalesce(excluded.placement_percentage, public.college_placement_statistics.placement_percentage),
  average_salary = coalesce(excluded.average_salary, public.college_placement_statistics.average_salary),
  highest_salary = coalesce(excluded.highest_salary, public.college_placement_statistics.highest_salary),
  placement_percentage_source_url = coalesce(excluded.placement_percentage_source_url, public.college_placement_statistics.placement_percentage_source_url),
  average_salary_source_url = coalesce(excluded.average_salary_source_url, public.college_placement_statistics.average_salary_source_url),
  highest_salary_source_url = coalesce(excluded.highest_salary_source_url, public.college_placement_statistics.highest_salary_source_url),
  source_type = excluded.source_type,
  is_self_reported = excluded.is_self_reported,
  source_url = excluded.source_url,
  source_confidence = excluded.source_confidence,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;
