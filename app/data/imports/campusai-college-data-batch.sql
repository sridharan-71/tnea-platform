-- CampusAI verified college-data batch
-- Generated from official college websites and NIRF disclosures.

-- Source: data/imports/official-site-nirf-placements.sql

begin;

insert into public.college_placement_statistics (
  college_id, academic_year, program_level,
  eligible_students, students_placed, students_higher_studies,
  median_salary, average_salary, highest_salary,
  source_type, is_self_reported, source_url, last_verified_at
)
values
(
    177, '2022-23', 'ug',
    1961, 1593, 165,
    750000, null, null,
    'nirf_disclosure', true, 'https://www.annauniv.edu/NIRF/Engineering_Anna%20University_09.03.2026.pdf', now()
  ),
(
    177, '2023-24', 'ug',
    1588, 1149, 189,
    800000, null, null,
    'nirf_disclosure', true, 'https://www.annauniv.edu/NIRF/Engineering_Anna%20University_09.03.2026.pdf', now()
  ),
(
    177, '2024-25', 'ug',
    2000, 1289, 116,
    750000, null, null,
    'nirf_disclosure', true, 'https://www.annauniv.edu/NIRF/Engineering_Anna%20University_09.03.2026.pdf', now()
  ),
(
    183, '2022-23', 'ug',
    494, 392, 50,
    480000, null, null,
    'nirf_disclosure', true, 'https://www.rmd.ac.in/nirf/overall-dcs2026.pdf', now()
  ),
(
    183, '2023-24', 'ug',
    499, 300, 52,
    423000, null, null,
    'nirf_disclosure', true, 'https://www.rmd.ac.in/nirf/overall-dcs2026.pdf', now()
  ),
(
    183, '2024-25', 'ug',
    510, 337, 39,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.rmd.ac.in/nirf/overall-dcs2026.pdf', now()
  ),
(
    184, '2022-23', 'ug',
    717, 498, 69,
    500000, null, null,
    'nirf_disclosure', true, 'https://www.rmkec.ac.in/2023/wp-content/uploads/2026/04/R.M.K.-Engineering-College-NIRF-2026-Overall-1.pdf', now()
  ),
(
    184, '2023-24', 'ug',
    727, 519, 109,
    550000, null, null,
    'nirf_disclosure', true, 'https://www.rmkec.ac.in/2023/wp-content/uploads/2026/04/R.M.K.-Engineering-College-NIRF-2026-Overall-1.pdf', now()
  ),
(
    184, '2024-25', 'ug',
    742, 571, 74,
    600000, null, null,
    'nirf_disclosure', true, 'https://www.rmkec.ac.in/2023/wp-content/uploads/2026/04/R.M.K.-Engineering-College-NIRF-2026-Overall-1.pdf', now()
  ),
(
    185, '2022-23', 'ug',
    355, 300, 17,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.saec.ac.in/assets/images/nirf/S.A.EngineeringCollege20260226-Overall.pdf', now()
  ),
(
    185, '2023-24', 'ug',
    323, 300, 20,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.saec.ac.in/assets/images/nirf/S.A.EngineeringCollege20260226-Overall.pdf', now()
  ),
(
    185, '2024-25', 'ug',
    568, 417, 21,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.saec.ac.in/assets/images/nirf/S.A.EngineeringCollege20260226-Overall.pdf', now()
  ),
(
    188, '2022-23', 'ug',
    602, 519, 32,
    475000, null, null,
    'nirf_disclosure', true, 'https://www.veltechmultitech.org/wp-content/uploads/2026/02/2026-NIRF-ENGINEERING.pdf', now()
  ),
(
    188, '2023-24', 'ug',
    550, 422, 30,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.veltechmultitech.org/wp-content/uploads/2026/02/2026-NIRF-ENGINEERING.pdf', now()
  ),
(
    188, '2024-25', 'ug',
    625, 493, 35,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.veltechmultitech.org/wp-content/uploads/2026/02/2026-NIRF-ENGINEERING.pdf', now()
  ),
(
    196, '2022-23', 'ug',
    143, 107, 13,
    250000, null, null,
    'nirf_disclosure', true, 'https://www.spcet.ac.in/assets/img/2025/doc/nirf_engineering.pdf', now()
  ),
(
    196, '2023-24', 'ug',
    70, 49, 7,
    280000, null, null,
    'nirf_disclosure', true, 'https://www.spcet.ac.in/assets/img/2025/doc/nirf_engineering.pdf', now()
  ),
(
    205, '2022-23', 'ug',
    227, 143, 10,
    540000, null, null,
    'nirf_disclosure', true, 'https://www.jeppiaarinstitute.org/wp-content/uploads/2025/01/NIRF-ENGINEERING.pdf', now()
  ),
(
    205, '2023-24', 'ug',
    181, 123, 16,
    419000, null, null,
    'nirf_disclosure', true, 'https://www.jeppiaarinstitute.org/wp-content/uploads/2025/01/NIRF-ENGINEERING.pdf', now()
  ),
(
    214, '2022-23', 'ug',
    270, 228, 30,
    243670, null, null,
    'nirf_disclosure', true, 'https://kingsedu-assets.in-maa-1.linodeobjects.com/nirf/NIRF-KEC.pdf', now()
  ),
(
    214, '2023-24', 'ug',
    233, 218, 14,
    260000, null, null,
    'nirf_disclosure', true, 'https://kingsedu-assets.in-maa-1.linodeobjects.com/nirf/NIRF-KEC.pdf', now()
  ),
(
    214, '2024-25', 'ug',
    384, 152, 12,
    300000, null, null,
    'nirf_disclosure', true, 'https://kingsedu-assets.in-maa-1.linodeobjects.com/nirf/NIRF-KEC.pdf', now()
  ),
(
    216, '2022-23', 'ug',
    1535, 1179, 120,
    401988, null, null,
    'nirf_disclosure', true, 'https://www.panimalar.ac.in/assets/pdf/academics/nirf/PEC-NIRF_2026-Engineering.pdf', now()
  ),
(
    216, '2023-24', 'ug',
    1491, 1249, 64,
    401988, null, null,
    'nirf_disclosure', true, 'https://www.panimalar.ac.in/assets/pdf/academics/nirf/PEC-NIRF_2026-Engineering.pdf', now()
  ),
(
    216, '2024-25', 'ug',
    1621, 1381, 84,
    600000, null, null,
    'nirf_disclosure', true, 'https://www.panimalar.ac.in/assets/pdf/academics/nirf/PEC-NIRF_2026-Engineering.pdf', now()
  ),
(
    220, '2022-23', 'ug',
    852, 699, 21,
    383000, null, null,
    'nirf_disclosure', true, 'https://saveetha.ac.in/wp-content/uploads/2026/02/SAVEETHA-ENGINEERING-COLLEGE20260216-.pdf', now()
  ),
(
    220, '2023-24', 'ug',
    817, 772, 20,
    520000, null, null,
    'nirf_disclosure', true, 'https://saveetha.ac.in/wp-content/uploads/2026/02/SAVEETHA-ENGINEERING-COLLEGE20260216-.pdf', now()
  ),
(
    220, '2024-25', 'ug',
    1021, 1004, 12,
    550000, null, null,
    'nirf_disclosure', true, 'https://saveetha.ac.in/wp-content/uploads/2026/02/SAVEETHA-ENGINEERING-COLLEGE20260216-.pdf', now()
  ),
(
    221, '2022-23', 'ug',
    14, 13, 1,
    250000, null, null,
    'nirf_disclosure', true, 'https://sasthainstitutions.in/wp-content/uploads/2024/03/NIRF-2024.pdf', now()
  ),
(
    222, '2022-23', 'ug',
    49, 33, 10,
    400000, null, null,
    'nirf_disclosure', true, 'https://smit.edu.in/wp-content/uploads/2026/04/Overall-NIRF-2026.pdf', now()
  ),
(
    222, '2023-24', 'ug',
    43, 37, 3,
    300000, null, null,
    'nirf_disclosure', true, 'https://smit.edu.in/wp-content/uploads/2026/04/Overall-NIRF-2026.pdf', now()
  ),
(
    222, '2024-25', 'ug',
    162, 150, 10,
    350000, null, null,
    'nirf_disclosure', true, 'https://smit.edu.in/wp-content/uploads/2026/04/Overall-NIRF-2026.pdf', now()
  ),
(
    223, '2022-23', 'ug',
    792, 604, 158,
    550000, null, null,
    'nirf_disclosure', true, 'https://www.svce.ac.in/wp-content/uploads/2026/04/NIRF-Engineering.pdf', now()
  ),
(
    223, '2023-24', 'ug',
    879, 672, 181,
    600000, null, null,
    'nirf_disclosure', true, 'https://www.svce.ac.in/wp-content/uploads/2026/04/NIRF-Engineering.pdf', now()
  ),
(
    223, '2024-25', 'ug',
    846, 695, 136,
    620000, null, null,
    'nirf_disclosure', true, 'https://www.svce.ac.in/wp-content/uploads/2026/04/NIRF-Engineering.pdf', now()
  ),
(
    234, '2022-23', 'ug',
    257, 180, 17,
    400000, null, null,
    'nirf_disclosure', true, 'https://velammalitech.edu.in/wp-content/uploads/2026/04/NIRF-Engineering-2026.pdf', now()
  ),
(
    234, '2023-24', 'ug',
    284, 175, 28,
    350000, null, null,
    'nirf_disclosure', true, 'https://velammalitech.edu.in/wp-content/uploads/2026/04/NIRF-Engineering-2026.pdf', now()
  ),
(
    234, '2024-25', 'ug',
    434, 328, 20,
    412000, null, null,
    'nirf_disclosure', true, 'https://velammalitech.edu.in/wp-content/uploads/2026/04/NIRF-Engineering-2026.pdf', now()
  ),
(
    235, '2022-23', 'ug',
    109, 98, 0,
    334000, null, null,
    'nirf_disclosure', true, 'https://grt.edu.in/wp-content/uploads/2026/02/NIRF-ENGINEERING-2026.pdf', now()
  ),
(
    235, '2023-24', 'ug',
    123, 110, 1,
    331000, null, null,
    'nirf_disclosure', true, 'https://grt.edu.in/wp-content/uploads/2026/02/NIRF-ENGINEERING-2026.pdf', now()
  ),
(
    235, '2024-25', 'ug',
    154, 137, 6,
    327000, null, null,
    'nirf_disclosure', true, 'https://grt.edu.in/wp-content/uploads/2026/02/NIRF-ENGINEERING-2026.pdf', now()
  ),
(
    238, '2022-23', 'ug',
    119, 102, 5,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.msajce-edu.in/uploads/nift/MSAJCE-ENGG-2026.pdf', now()
  ),
(
    238, '2023-24', 'ug',
    155, 130, 5,
    330000, null, null,
    'nirf_disclosure', true, 'https://www.msajce-edu.in/uploads/nift/MSAJCE-ENGG-2026.pdf', now()
  ),
(
    238, '2024-25', 'ug',
    168, 27, 5,
    420000, null, null,
    'nirf_disclosure', true, 'https://www.msajce-edu.in/uploads/nift/MSAJCE-ENGG-2026.pdf', now()
  ),
(
    239, '2022-23', 'ug',
    438, 133, 8,
    350000, null, null,
    'nirf_disclosure', true, 'http://www.aiht.ac.in/vendor/pdf/AIHT-NIRF-DCS-ENGG.pdf', now()
  ),
(
    239, '2023-24', 'ug',
    346, 330, 12,
    385000, null, null,
    'nirf_disclosure', true, 'http://www.aiht.ac.in/vendor/pdf/AIHT-NIRF-DCS-ENGG.pdf', now()
  ),
(
    241, '2022-23', 'ug',
    372, 350, 13,
    350000, null, null,
    'nirf_disclosure', true, 'https://jeppiaarcollege.org/jeppiaar/wp-content/uploads/2025/07/NIRF-OVERALL-2025.pdf', now()
  ),
(
    241, '2023-24', 'ug',
    314, 116, 24,
    400000, null, null,
    'nirf_disclosure', true, 'https://jeppiaarcollege.org/jeppiaar/wp-content/uploads/2025/07/NIRF-OVERALL-2025.pdf', now()
  ),
(
    242, '2022-23', 'ug',
    267, 251, 12,
    500000, null, null,
    'nirf_disclosure', true, 'https://jerusalemengg.ac.in/pdf/JCE-Engineering-NIRF2025.pdf', now()
  ),
(
    242, '2023-24', 'ug',
    218, 201, 15,
    500000, null, null,
    'nirf_disclosure', true, 'https://jerusalemengg.ac.in/pdf/JCE-Engineering-NIRF2025.pdf', now()
  ),
(
    243, '2022-23', 'ug',
    344, 283, 19,
    400000, null, null,
    'nirf_disclosure', true, 'https://msec.edu.in/Meenakshi%20Sundararajan%20Engineering%20College20260304-.pdf', now()
  ),
(
    243, '2023-24', 'ug',
    312, 221, 17,
    420000, null, null,
    'nirf_disclosure', true, 'https://msec.edu.in/Meenakshi%20Sundararajan%20Engineering%20College20260304-.pdf', now()
  ),
(
    243, '2024-25', 'ug',
    440, 428, 6,
    560000, null, null,
    'nirf_disclosure', true, 'https://msec.edu.in/Meenakshi%20Sundararajan%20Engineering%20College20260304-.pdf', now()
  ),
(
    245, '2022-23', 'ug',
    451, 325, 10,
    400000, null, null,
    'nirf_disclosure', true, 'https://kcgcollege.ac.in/pdf/NIRF-2026/NIRF-DCS-FULL-REPORT-ENGINEERING-2026.pdf', now()
  ),
(
    245, '2023-24', 'ug',
    505, 352, 11,
    400000, null, null,
    'nirf_disclosure', true, 'https://kcgcollege.ac.in/pdf/NIRF-2026/NIRF-DCS-FULL-REPORT-ENGINEERING-2026.pdf', now()
  ),
(
    245, '2024-25', 'ug',
    581, 495, 48,
    600000, null, null,
    'nirf_disclosure', true, 'https://kcgcollege.ac.in/pdf/NIRF-2026/NIRF-DCS-FULL-REPORT-ENGINEERING-2026.pdf', now()
  ),
(
    249, '2022-23', 'ug',
    1089, 714, 93,
    400000, null, null,
    'nirf_disclosure', true, 'https://stjosephs.ac.in/NIRF/NIRF2026/NIRF2026.pdf', now()
  ),
(
    249, '2023-24', 'ug',
    962, 815, 126,
    460000, null, null,
    'nirf_disclosure', true, 'https://stjosephs.ac.in/NIRF/NIRF2026/NIRF2026.pdf', now()
  ),
(
    249, '2024-25', 'ug',
    1114, 884, 131,
    475000, null, null,
    'nirf_disclosure', true, 'https://stjosephs.ac.in/NIRF/NIRF2026/NIRF2026.pdf', now()
  ),
(
    253, '2022-23', 'ug',
    316, 262, 2,
    280000, null, null,
    'nirf_disclosure', true, 'https://dscet.ac.in/nirf/pdf/NIRF2025.pdf', now()
  ),
(
    253, '2023-24', 'ug',
    320, 314, 3,
    420000, null, null,
    'nirf_disclosure', true, 'https://dscet.ac.in/nirf/pdf/NIRF2025.pdf', now()
  ),
(
    254, '2022-23', 'ug',
    453, 381, 38,
    465000, null, null,
    'nirf_disclosure', true, 'https://sairamit.edu.in/wp-content/uploads/2024/02/IR-E-C-16476-Engineering.pdf', now()
  ),
(
    254, '2023-24', 'ug',
    537, 431, 57,
    485000, null, null,
    'nirf_disclosure', true, 'https://sairamit.edu.in/wp-content/uploads/2024/02/IR-E-C-16476-Engineering.pdf', now()
  ),
(
    255, '2022-23', 'ug',
    276, 247, 10,
    340000, null, null,
    'nirf_disclosure', true, 'https://www.stjoseph.ac.in/nirf/NIRF%20Report%202026.pdf', now()
  ),
(
    255, '2023-24', 'ug',
    177, 158, 19,
    359000, null, null,
    'nirf_disclosure', true, 'https://www.stjoseph.ac.in/nirf/NIRF%20Report%202026.pdf', now()
  ),
(
    255, '2024-25', 'ug',
    211, 191, 12,
    375200, null, null,
    'nirf_disclosure', true, 'https://www.stjoseph.ac.in/nirf/NIRF%20Report%202026.pdf', now()
  ),
(
    262, '2022-23', 'ug',
    190, 148, 19,
    240000, null, null,
    'nirf_disclosure', true, 'https://assets.super.so/47fa140c-5512-4ac6-a02b-6305f7e083a9/files/b2e7dd26-fa42-44cc-8fc6-e6c8988cb7bb/apec_nirf_engineering_2026_-ir-e-c-16487.pdf', now()
  ),
(
    262, '2023-24', 'ug',
    152, 127, 11,
    205000, null, null,
    'nirf_disclosure', true, 'https://assets.super.so/47fa140c-5512-4ac6-a02b-6305f7e083a9/files/b2e7dd26-fa42-44cc-8fc6-e6c8988cb7bb/apec_nirf_engineering_2026_-ir-e-c-16487.pdf', now()
  ),
(
    262, '2024-25', 'ug',
    264, 185, 22,
    1500000, null, null,
    'nirf_disclosure', true, 'https://assets.super.so/47fa140c-5512-4ac6-a02b-6305f7e083a9/files/b2e7dd26-fa42-44cc-8fc6-e6c8988cb7bb/apec_nirf_engineering_2026_-ir-e-c-16487.pdf', now()
  ),
(
    264, '2022-23', 'ug',
    249, 235, 3,
    300000, null, null,
    'nirf_disclosure', true, 'https://dce.edu.in/wp-content/uploads/2026/03/NIRF-2026.pdf', now()
  ),
(
    264, '2023-24', 'ug',
    92, 88, 3,
    200000, null, null,
    'nirf_disclosure', true, 'https://dce.edu.in/wp-content/uploads/2026/03/NIRF-2026.pdf', now()
  ),
(
    264, '2024-25', 'ug',
    261, 218, 1,
    330000, null, null,
    'nirf_disclosure', true, 'https://dce.edu.in/wp-content/uploads/2026/03/NIRF-2026.pdf', now()
  ),
(
    265, '2022-23', 'ug',
    80, 65, 15,
    340000, null, null,
    'nirf_disclosure', true, 'https://www.gkmcet.net.in/pdf/NIRF-2025.pdf', now()
  ),
(
    265, '2023-24', 'ug',
    80, 70, 10,
    450000, null, null,
    'nirf_disclosure', true, 'https://www.gkmcet.net.in/pdf/NIRF-2025.pdf', now()
  ),
(
    266, '2022-23', 'ug',
    312, 234, 20,
    336000, null, null,
    'nirf_disclosure', true, 'https://ifet.ac.in/wp-content/uploads/2024/08/NIRF-Engg-2026.pdf', now()
  ),
(
    266, '2023-24', 'ug',
    324, 285, 31,
    300000, null, null,
    'nirf_disclosure', true, 'https://ifet.ac.in/wp-content/uploads/2024/08/NIRF-Engg-2026.pdf', now()
  ),
(
    266, '2024-25', 'ug',
    401, 347, 54,
    450000, null, null,
    'nirf_disclosure', true, 'https://ifet.ac.in/wp-content/uploads/2024/08/NIRF-Engg-2026.pdf', now()
  ),
(
    269, '2022-23', 'ug',
    260, 248, 4,
    280000, null, null,
    'nirf_disclosure', true, 'https://mailamengg.ac.in/wp-content/uploads/2025/02/Mailam-Engineering-College-2025.pdf', now()
  ),
(
    269, '2023-24', 'ug',
    228, 219, 9,
    228000, null, null,
    'nirf_disclosure', true, 'https://mailamengg.ac.in/wp-content/uploads/2025/02/Mailam-Engineering-College-2025.pdf', now()
  ),
(
    271, '2022-23', 'ug',
    351, 244, 63,
    425000, null, null,
    'nirf_disclosure', true, 'https://psvpec.in/wp-content/uploads/2026/04/NIRF.pdf', now()
  ),
(
    271, '2023-24', 'ug',
    332, 297, 23,
    450000, null, null,
    'nirf_disclosure', true, 'https://psvpec.in/wp-content/uploads/2026/04/NIRF.pdf', now()
  ),
(
    271, '2024-25', 'ug',
    339, 303, 20,
    500000, null, null,
    'nirf_disclosure', true, 'https://psvpec.in/wp-content/uploads/2026/04/NIRF.pdf', now()
  ),
(
    274, '2022-23', 'ug',
    1005, 719, 92,
    450000, null, null,
    'nirf_disclosure', true, 'https://sairam.edu.in/wp-content/uploads/2026/04/NIRF-ENGINEERING-2026.pdf', now()
  ),
(
    274, '2023-24', 'ug',
    1122, 774, 179,
    490000, null, null,
    'nirf_disclosure', true, 'https://sairam.edu.in/wp-content/uploads/2026/04/NIRF-ENGINEERING-2026.pdf', now()
  ),
(
    274, '2024-25', 'ug',
    1249, 1034, 182,
    520000, null, null,
    'nirf_disclosure', true, 'https://sairam.edu.in/wp-content/uploads/2026/04/NIRF-ENGINEERING-2026.pdf', now()
  ),
(
    284, '2022-23', 'ug',
    77, 76, 1,
    460000, null, null,
    'nirf_disclosure', true, 'https://npsbcet.edu.in/wp-content/uploads/2026/04/NIRF-OVERALL-2026.pdf', now()
  ),
(
    284, '2023-24', 'ug',
    125, 125, 0,
    610000, null, null,
    'nirf_disclosure', true, 'https://npsbcet.edu.in/wp-content/uploads/2026/04/NIRF-OVERALL-2026.pdf', now()
  ),
(
    284, '2024-25', 'ug',
    231, 231, 0,
    675000, null, null,
    'nirf_disclosure', true, 'https://npsbcet.edu.in/wp-content/uploads/2026/04/NIRF-OVERALL-2026.pdf', now()
  ),
(
    285, '2022-23', 'ug',
    282, 269, 12,
    516000, null, null,
    'nirf_disclosure', true, 'https://ritchennai.org/nirf-2026/RIT-Data-Capturing-System-OVERALL-2026.pdf', now()
  ),
(
    285, '2023-24', 'ug',
    348, 337, 11,
    535000, null, null,
    'nirf_disclosure', true, 'https://ritchennai.org/nirf-2026/RIT-Data-Capturing-System-OVERALL-2026.pdf', now()
  ),
(
    285, '2024-25', 'ug',
    676, 628, 38,
    725000, null, null,
    'nirf_disclosure', true, 'https://ritchennai.org/nirf-2026/RIT-Data-Capturing-System-OVERALL-2026.pdf', now()
  ),
(
    288, '2022-23', 'ug',
    58, 47, 7,
    240000, null, null,
    'nirf_disclosure', true, 'https://rrase.com/wp-content/uploads/2025/02/RRASE-College-of-Engineering20241230-.pdf', now()
  ),
(
    288, '2023-24', 'ug',
    25, 20, 0,
    300000, null, null,
    'nirf_disclosure', true, 'https://rrase.com/wp-content/uploads/2025/02/RRASE-College-of-Engineering20241230-.pdf', now()
  ),
(
    290, '2022-23', 'ug',
    101, 100, 1,
    220000, null, null,
    'nirf_disclosure', true, 'https://www.aktmcet.in/assets/img/NIRF%202024.pdf', now()
  ),
(
    290, '2023-24', 'ug',
    126, 110, 5,
    226800, null, null,
    'nirf_disclosure', true, 'https://www.aktmcet.in/assets/img/NIRF%202024.pdf', now()
  ),
(
    291, '2022-23', 'ug',
    219, 134, 4,
    425000, null, null,
    'nirf_disclosure', true, 'https://www.princedrkvasudevan.com/AICTE/NIRF.pdf', now()
  ),
(
    291, '2023-24', 'ug',
    176, 84, 4,
    425000, null, null,
    'nirf_disclosure', true, 'https://www.princedrkvasudevan.com/AICTE/NIRF.pdf', now()
  ),
(
    291, '2024-25', 'ug',
    196, 178, 5,
    500000, null, null,
    'nirf_disclosure', true, 'https://www.princedrkvasudevan.com/AICTE/NIRF.pdf', now()
  ),
(
    297, '2022-23', 'ug',
    69, 56, 3,
    250000, null, null,
    'nirf_disclosure', true, 'https://www.apce.in/doc/NIRF%202026_Overall.pdf', now()
  ),
(
    297, '2023-24', 'ug',
    73, 60, 2,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.apce.in/doc/NIRF%202026_Overall.pdf', now()
  ),
(
    297, '2024-25', 'ug',
    126, 112, 0,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.apce.in/doc/NIRF%202026_Overall.pdf', now()
  ),
(
    298, '2022-23', 'ug',
    16, 10, 6,
    50000, null, null,
    'nirf_disclosure', true, 'https://www.amace.edu.in/uploads/nirf/nirf_amace_engineering.pdf', now()
  ),
(
    298, '2023-24', 'ug',
    80, 15, 65,
    50000, null, null,
    'nirf_disclosure', true, 'https://www.amace.edu.in/uploads/nirf/nirf_amace_engineering.pdf', now()
  ),
(
    302, '2022-23', 'ug',
    211, 184, 9,
    480000, null, null,
    'nirf_disclosure', true, 'https://mce.edu.in/uploads/nirf/mce_nirf_engi.pdf', now()
  ),
(
    302, '2023-24', 'ug',
    214, 154, 7,
    260000, null, null,
    'nirf_disclosure', true, 'https://mce.edu.in/uploads/nirf/mce_nirf_engi.pdf', now()
  ),
(
    313, '2022-23', 'ug',
    182, 175, 3,
    1300000, null, null,
    'nirf_disclosure', true, 'https://getedu.in/nirf/NIRF-2026.pdf', now()
  ),
(
    313, '2023-24', 'ug',
    220, 209, 6,
    1075000, null, null,
    'nirf_disclosure', true, 'https://getedu.in/nirf/NIRF-2026.pdf', now()
  ),
(
    313, '2024-25', 'ug',
    230, 220, 5,
    800000, null, null,
    'nirf_disclosure', true, 'https://getedu.in/nirf/NIRF-2026.pdf', now()
  ),
(
    323, '2022-23', 'ug',
    713, 646, 62,
    578000, null, null,
    'nirf_disclosure', true, 'https://cit.edu.in/uploads/epdf_documents/1a5a87365c853fcf3afbd733e6ac657b.pdf', now()
  ),
(
    323, '2023-24', 'ug',
    751, 660, 85,
    680000, null, null,
    'nirf_disclosure', true, 'https://cit.edu.in/uploads/epdf_documents/1a5a87365c853fcf3afbd733e6ac657b.pdf', now()
  ),
(
    328, '2022-23', 'ug',
    189, 178, 9,
    300000, null, null,
    'nirf_disclosure', true, 'https://ksriet.ac.in/admin/file_manager/source/nirf/NIRF-2024-KSRIET.pdf', now()
  ),
(
    329, '2022-23', 'ug',
    255, 251, 4,
    575000, null, null,
    'nirf_disclosure', true, 'https://rtc.ac.in/wp-content/uploads/2026/04/NIRF-Overall-2.4.26.pdf', now()
  ),
(
    329, '2023-24', 'ug',
    360, 342, 18,
    580000, null, null,
    'nirf_disclosure', true, 'https://rtc.ac.in/wp-content/uploads/2026/04/NIRF-Overall-2.4.26.pdf', now()
  ),
(
    329, '2024-25', 'ug',
    399, 384, 15,
    950000, null, null,
    'nirf_disclosure', true, 'https://rtc.ac.in/wp-content/uploads/2026/04/NIRF-Overall-2.4.26.pdf', now()
  ),
(
    333, '2022-23', 'ug',
    107, 106, 1,
    400000, null, null,
    'nirf_disclosure', true, 'https://sriet.ac.in/wp-content/uploads/2025/02/NIRF-2025-ENGINEERING.pdf', now()
  ),
(
    333, '2023-24', 'ug',
    108, 105, 3,
    350000, null, null,
    'nirf_disclosure', true, 'https://sriet.ac.in/wp-content/uploads/2025/02/NIRF-2025-ENGINEERING.pdf', now()
  ),
(
    336, '2022-23', 'ug',
    305, 255, 8,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.dgct.ac.in/nirf2026.pdf', now()
  ),
(
    336, '2023-24', 'ug',
    211, 201, 10,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.dgct.ac.in/nirf2026.pdf', now()
  ),
(
    336, '2024-25', 'ug',
    271, 235, 4,
    360000, null, null,
    'nirf_disclosure', true, 'https://www.dgct.ac.in/nirf2026.pdf', now()
  ),
(
    344, '2022-23', 'ug',
    191, 175, 4,
    400000, null, null,
    'nirf_disclosure', true, 'https://vsbcetc.edu.in/wp-content/uploads/2024/03/V.S.B-College-2022-23-NIRF-RANKING-2024.pdf', now()
  ),
(
    355, '2022-23', 'ug',
    300, 264, 11,
    750000, null, null,
    'nirf_disclosure', true, 'https://psgitech.ac.in/uploads/pdf/NIRF/NIRF_2026_PSGiTech.pdf', now()
  ),
(
    355, '2023-24', 'ug',
    291, 247, 32,
    700000, null, null,
    'nirf_disclosure', true, 'https://psgitech.ac.in/uploads/pdf/NIRF/NIRF_2026_PSGiTech.pdf', now()
  ),
(
    355, '2024-25', 'ug',
    311, 269, 26,
    750000, null, null,
    'nirf_disclosure', true, 'https://psgitech.ac.in/uploads/pdf/NIRF/NIRF_2026_PSGiTech.pdf', now()
  ),
(
    363, '2022-23', 'ug',
    716, 573, 21,
    290000, null, null,
    'nirf_disclosure', true, 'https://mec.edu.in/storage/2026/03/Muthayammal-Engineering-College20260314-Engineering.pdf', now()
  ),
(
    363, '2023-24', 'ug',
    840, 649, 20,
    385000, null, null,
    'nirf_disclosure', true, 'https://mec.edu.in/storage/2026/03/Muthayammal-Engineering-College20260314-Engineering.pdf', now()
  ),
(
    363, '2024-25', 'ug',
    887, 672, 50,
    503707, null, null,
    'nirf_disclosure', true, 'https://mec.edu.in/storage/2026/03/Muthayammal-Engineering-College20260314-Engineering.pdf', now()
  ),
(
    364, '2022-23', 'ug',
    795, 760, 33,
    320000, null, null,
    'nirf_disclosure', true, 'https://pec.paavai.edu.in/wp-content/uploads/2026/04/Paavai-Engineering-College.pdf', now()
  ),
(
    364, '2023-24', 'ug',
    744, 686, 53,
    425000, null, null,
    'nirf_disclosure', true, 'https://pec.paavai.edu.in/wp-content/uploads/2026/04/Paavai-Engineering-College.pdf', now()
  ),
(
    364, '2024-25', 'ug',
    736, 668, 60,
    440000, null, null,
    'nirf_disclosure', true, 'https://pec.paavai.edu.in/wp-content/uploads/2026/04/Paavai-Engineering-College.pdf', now()
  ),
(
    367, '2022-23', 'ug',
    222, 182, 20,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.ssmce.ac.in/pdf/NIRF-SSM_College_of_Engineering_2025_NEW.pdf', now()
  ),
(
    367, '2023-24', 'ug',
    322, 205, 24,
    380000, null, null,
    'nirf_disclosure', true, 'https://www.ssmce.ac.in/pdf/NIRF-SSM_College_of_Engineering_2025_NEW.pdf', now()
  ),
(
    370, '2022-23', 'ug',
    146, 144, 2,
    360000, null, null,
    'nirf_disclosure', true, 'https://sect.edu.in/pdf/OVERALL%20_NIRF%202025.pdf', now()
  ),
(
    370, '2023-24', 'ug',
    440, 418, 12,
    420000, null, null,
    'nirf_disclosure', true, 'https://sect.edu.in/pdf/OVERALL%20_NIRF%202025.pdf', now()
  ),
(
    372, '2022-23', 'ug',
    392, 304, 25,
    310000, null, null,
    'nirf_disclosure', true, 'https://www.vcenggw.ac.in/pdf/nirf/2026/Overall.pdf', now()
  ),
(
    372, '2023-24', 'ug',
    471, 341, 33,
    220000, null, null,
    'nirf_disclosure', true, 'https://www.vcenggw.ac.in/pdf/nirf/2026/Overall.pdf', now()
  ),
(
    372, '2024-25', 'ug',
    491, 320, 153,
    312000, null, null,
    'nirf_disclosure', true, 'https://www.vcenggw.ac.in/pdf/nirf/2026/Overall.pdf', now()
  ),
(
    378, '2022-23', 'ug',
    138, 117, 20,
    144000, null, null,
    'nirf_disclosure', true, 'https://selvamtech.edu.in/wp-content/uploads/2026/04/SCT-NIRF-Engg-Application-2024-2025.pdf', now()
  ),
(
    378, '2023-24', 'ug',
    225, 212, 6,
    400000, null, null,
    'nirf_disclosure', true, 'https://selvamtech.edu.in/wp-content/uploads/2026/04/SCT-NIRF-Engg-Application-2024-2025.pdf', now()
  ),
(
    378, '2024-25', 'ug',
    199, 160, 14,
    225000, null, null,
    'nirf_disclosure', true, 'https://selvamtech.edu.in/wp-content/uploads/2026/04/SCT-NIRF-Engg-Application-2024-2025.pdf', now()
  ),
(
    390, '2022-23', 'ug',
    154, 146, 8,
    340000, null, null,
    'nirf_disclosure', true, 'https://psvcet.ac.in/psv-doc/psv2026overall.pdf', now()
  ),
(
    390, '2023-24', 'ug',
    220, 190, 14,
    380000, null, null,
    'nirf_disclosure', true, 'https://psvcet.ac.in/psv-doc/psv2026overall.pdf', now()
  ),
(
    390, '2024-25', 'ug',
    161, 152, 9,
    400000, null, null,
    'nirf_disclosure', true, 'https://psvcet.ac.in/psv-doc/psv2026overall.pdf', now()
  ),
(
    391, '2022-23', 'ug',
    133, 116, 3,
    288000, null, null,
    'nirf_disclosure', true, 'https://biew.ac.in/wp-content/uploads/2023/02/BHARATHIYAR-INSTITUTE-OF-ENGINEERING-FOR-WOMEN20230120-OVERALL.pdf', now()
  ),
(
    393, '2022-23', 'ug',
    126, 29, 3,
    168000, null, null,
    'nirf_disclosure', true, 'https://engg.jkkn.ac.in/documents/nirf/2024/engineering.pdf', now()
  ),
(
    394, '2022-23', 'ug',
    103, 92, 5,
    220000, null, null,
    'nirf_disclosure', true, 'https://www.aecsalem.edu.in/files/NIRF/AEC-NIRF-2026.pdf', now()
  ),
(
    394, '2023-24', 'ug',
    201, 165, 9,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.aecsalem.edu.in/files/NIRF/AEC-NIRF-2026.pdf', now()
  ),
(
    394, '2024-25', 'ug',
    266, 211, 12,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.aecsalem.edu.in/files/NIRF/AEC-NIRF-2026.pdf', now()
  ),
(
    395, '2022-23', 'ug',
    137, 130, 7,
    200000, null, null,
    'nirf_disclosure', true, 'https://ckec.ac.in/ANNAUNIVERSITY/nirf/nirf2026.pdf', now()
  ),
(
    395, '2023-24', 'ug',
    66, 63, 3,
    400000, null, null,
    'nirf_disclosure', true, 'https://ckec.ac.in/ANNAUNIVERSITY/nirf/nirf2026.pdf', now()
  ),
(
    395, '2024-25', 'ug',
    65, 64, 1,
    400000, null, null,
    'nirf_disclosure', true, 'https://ckec.ac.in/ANNAUNIVERSITY/nirf/nirf2026.pdf', now()
  ),
(
    396, '2022-23', 'ug',
    92, 82, 6,
    325000, null, null,
    'nirf_disclosure', true, 'https://www.jayshriram.edu.in/pdf/NIRF-Overall_merged.pdf', now()
  ),
(
    397, '2022-23', 'ug',
    98, 96, 2,
    264000, null, null,
    'nirf_disclosure', true, 'https://alameen.ac.in/wp-content/uploads/2026/04/AL-Ameen-Engineering-College20260415-1-3.pdf', now()
  ),
(
    397, '2023-24', 'ug',
    161, 155, 6,
    240000, null, null,
    'nirf_disclosure', true, 'https://alameen.ac.in/wp-content/uploads/2026/04/AL-Ameen-Engineering-College20260415-1-3.pdf', now()
  ),
(
    397, '2024-25', 'ug',
    194, 190, 3,
    240000, null, null,
    'nirf_disclosure', true, 'https://alameen.ac.in/wp-content/uploads/2026/04/AL-Ameen-Engineering-College20260415-1-3.pdf', now()
  ),
(
    398, '2022-23', 'ug',
    313, 308, 5,
    325000, null, null,
    'nirf_disclosure', true, 'https://kiot.ac.in/wp-content/uploads/2026/04/NIRF-2026-Engineering.pdf', now()
  ),
(
    398, '2023-24', 'ug',
    554, 478, 8,
    360000, null, null,
    'nirf_disclosure', true, 'https://kiot.ac.in/wp-content/uploads/2026/04/NIRF-2026-Engineering.pdf', now()
  ),
(
    398, '2024-25', 'ug',
    647, 614, 10,
    350000, null, null,
    'nirf_disclosure', true, 'https://kiot.ac.in/wp-content/uploads/2026/04/NIRF-2026-Engineering.pdf', now()
  ),
(
    405, '2022-23', 'ug',
    39, 32, 7,
    324000, null, null,
    'nirf_disclosure', true, 'https://www.sreesakthi.edu.in/assets/documents/iqac/NIRF.pdf', now()
  ),
(
    405, '2023-24', 'ug',
    61, 59, 2,
    330000, null, null,
    'nirf_disclosure', true, 'https://www.sreesakthi.edu.in/assets/documents/iqac/NIRF.pdf', now()
  ),
(
    407, '2022-23', 'ug',
    1795, 1651, 30,
    500000, null, null,
    'nirf_disclosure', true, 'https://www.bitsathy.ac.in/wp-content/uploads/NIFR-2026.pdf', now()
  ),
(
    407, '2023-24', 'ug',
    1640, 1451, 73,
    520000, null, null,
    'nirf_disclosure', true, 'https://www.bitsathy.ac.in/wp-content/uploads/NIFR-2026.pdf', now()
  ),
(
    407, '2024-25', 'ug',
    1671, 1460, 69,
    550000, null, null,
    'nirf_disclosure', true, 'https://www.bitsathy.ac.in/wp-content/uploads/NIFR-2026.pdf', now()
  ),
(
    409, '2022-23', 'ug',
    56, 54, 2,
    395000, null, null,
    'nirf_disclosure', true, 'https://csice.edu.in/wp-content/uploads/2025/02/NIRF_CSI-College-of-Engineering20250121.pdf', now()
  ),
(
    409, '2023-24', 'ug',
    54, 43, 11,
    370000, null, null,
    'nirf_disclosure', true, 'https://csice.edu.in/wp-content/uploads/2025/02/NIRF_CSI-College-of-Engineering20250121.pdf', now()
  ),
(
    411, '2022-23', 'ug',
    385, 362, 17,
    300000, null, null,
    'nirf_disclosure', true, 'https://erode-sengunthar.ac.in/wp-content/uploads/2026/04/NIRF-ENGG-26.pdf', now()
  ),
(
    411, '2023-24', 'ug',
    593, 575, 18,
    340000, null, null,
    'nirf_disclosure', true, 'https://erode-sengunthar.ac.in/wp-content/uploads/2026/04/NIRF-ENGG-26.pdf', now()
  ),
(
    411, '2024-25', 'ug',
    686, 658, 28,
    350000, null, null,
    'nirf_disclosure', true, 'https://erode-sengunthar.ac.in/wp-content/uploads/2026/04/NIRF-ENGG-26.pdf', now()
  ),
(
    413, '2022-23', 'ug',
    310, 77, 11,
    140000, null, null,
    'nirf_disclosure', true, 'https://www.gcee.ac.in/NIRF/NIRF2024.pdf', now()
  ),
(
    417, '2022-23', 'ug',
    60, 60, 0,
    220000, null, null,
    'nirf_disclosure', true, 'https://mpnmjec.ac.in/wp-content/uploads/2026/04/NIRF2026-ENGG.pdf', now()
  ),
(
    417, '2023-24', 'ug',
    71, 67, 4,
    250000, null, null,
    'nirf_disclosure', true, 'https://mpnmjec.ac.in/wp-content/uploads/2026/04/NIRF2026-ENGG.pdf', now()
  ),
(
    417, '2024-25', 'ug',
    110, 92, 6,
    300000, null, null,
    'nirf_disclosure', true, 'https://mpnmjec.ac.in/wp-content/uploads/2026/04/NIRF2026-ENGG.pdf', now()
  ),
(
    418, '2022-23', 'ug',
    662, 646, 16,
    423000, null, null,
    'nirf_disclosure', true, 'https://nandhaengg.org/wp-content/uploads/2025/02/NEC-NIRF-2025-Engineering.pdf', now()
  ),
(
    418, '2023-24', 'ug',
    688, 637, 28,
    414000, null, null,
    'nirf_disclosure', true, 'https://nandhaengg.org/wp-content/uploads/2025/02/NEC-NIRF-2025-Engineering.pdf', now()
  ),
(
    419, '2022-23', 'ug',
    214, 162, 17,
    295000, null, null,
    'nirf_disclosure', true, 'https://www.pcet.ac.in/NIRF/PCET_NIRF_Engineering.pdf', now()
  ),
(
    419, '2023-24', 'ug',
    94, 77, 4,
    210000, null, null,
    'nirf_disclosure', true, 'https://www.pcet.ac.in/NIRF/PCET_NIRF_Engineering.pdf', now()
  ),
(
    421, '2022-23', 'ug',
    1115, 998, 110,
    600000, null, null,
    'nirf_disclosure', true, 'https://skcet.ac.in/wp-content/uploads/2026/04/Overall.pdf', now()
  ),
(
    421, '2023-24', 'ug',
    1084, 991, 92,
    700000, null, null,
    'nirf_disclosure', true, 'https://skcet.ac.in/wp-content/uploads/2026/04/Overall.pdf', now()
  ),
(
    421, '2024-25', 'ug',
    1077, 985, 88,
    800000, null, null,
    'nirf_disclosure', true, 'https://skcet.ac.in/wp-content/uploads/2026/04/Overall.pdf', now()
  ),
(
    425, '2022-23', 'ug',
    706, 557, 22,
    325000, null, null,
    'nirf_disclosure', true, 'https://www.velalarengg.ac.in/wp-content/uploads/2026/04/NIRF-2026-IR-E-C-37094-Report-Engineering.pdf', now()
  ),
(
    425, '2023-24', 'ug',
    738, 501, 30,
    325000, null, null,
    'nirf_disclosure', true, 'https://www.velalarengg.ac.in/wp-content/uploads/2026/04/NIRF-2026-IR-E-C-37094-Report-Engineering.pdf', now()
  ),
(
    425, '2024-25', 'ug',
    729, 591, 33,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.velalarengg.ac.in/wp-content/uploads/2026/04/NIRF-2026-IR-E-C-37094-Report-Engineering.pdf', now()
  ),
(
    427, '2022-23', 'ug',
    917, 799, 93,
    521000, null, null,
    'nirf_disclosure', true, 'https://snsiqac.org/NIRF/NIRF%202026/NIRF%202026_SNSCT_ENGG.pdf', now()
  ),
(
    427, '2023-24', 'ug',
    831, 753, 61,
    545000, null, null,
    'nirf_disclosure', true, 'https://snsiqac.org/NIRF/NIRF%202026/NIRF%202026_SNSCT_ENGG.pdf', now()
  ),
(
    427, '2024-25', 'ug',
    911, 871, 36,
    615000, null, null,
    'nirf_disclosure', true, 'https://snsiqac.org/NIRF/NIRF%202026/NIRF%202026_SNSCT_ENGG.pdf', now()
  ),
(
    430, '2022-23', 'ug',
    143, 133, 10,
    225360, null, null,
    'nirf_disclosure', true, 'https://www.nehrucolleges.org/docs/nirf/2026/NIET-26-NIRF-ENGINEERING.pdf', now()
  ),
(
    430, '2023-24', 'ug',
    215, 197, 18,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.nehrucolleges.org/docs/nirf/2026/NIET-26-NIRF-ENGINEERING.pdf', now()
  ),
(
    430, '2024-25', 'ug',
    369, 345, 24,
    440000, null, null,
    'nirf_disclosure', true, 'https://www.nehrucolleges.org/docs/nirf/2026/NIET-26-NIRF-ENGINEERING.pdf', now()
  ),
(
    432, '2022-23', 'ug',
    35, 30, 4,
    250000, null, null,
    'nirf_disclosure', true, 'http://www.infoengg.com/images/NIRF2526INFO.pdf', now()
  ),
(
    432, '2023-24', 'ug',
    27, 27, 0,
    260000, null, null,
    'nirf_disclosure', true, 'http://www.infoengg.com/images/NIRF2526INFO.pdf', now()
  ),
(
    432, '2024-25', 'ug',
    58, 50, 2,
    300000, null, null,
    'nirf_disclosure', true, 'http://www.infoengg.com/images/NIRF2526INFO.pdf', now()
  ),
(
    435, '2022-23', 'ug',
    149, 143, 3,
    350000, null, null,
    'nirf_disclosure', true, 'https://karpagamtech.ac.in/kit/wp-content/uploads/2025/02/Karpagam-Institute-of-Technology20250214-.pdf', now()
  ),
(
    435, '2023-24', 'ug',
    228, 228, 0,
    300000, null, null,
    'nirf_disclosure', true, 'https://karpagamtech.ac.in/kit/wp-content/uploads/2025/02/Karpagam-Institute-of-Technology20250214-.pdf', now()
  ),
(
    436, '2022-23', 'ug',
    450, 428, 22,
    450000, null, null,
    'nirf_disclosure', true, 'https://www.drngpit.ac.in/pdfs/nirf/nirf-overall-2026-full-report.pdf', now()
  ),
(
    436, '2023-24', 'ug',
    392, 360, 23,
    460000, null, null,
    'nirf_disclosure', true, 'https://www.drngpit.ac.in/pdfs/nirf/nirf-overall-2026-full-report.pdf', now()
  ),
(
    436, '2024-25', 'ug',
    528, 470, 22,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.drngpit.ac.in/pdfs/nirf/nirf-overall-2026-full-report.pdf', now()
  ),
(
    440, '2022-23', 'ug',
    230, 225, 2,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.pacolleges.org/images/accrediation/NIRF%202026.pdf', now()
  ),
(
    440, '2023-24', 'ug',
    261, 246, 0,
    216000, null, null,
    'nirf_disclosure', true, 'https://www.pacolleges.org/images/accrediation/NIRF%202026.pdf', now()
  ),
(
    440, '2024-25', 'ug',
    338, 285, 5,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.pacolleges.org/images/accrediation/NIRF%202026.pdf', now()
  ),
(
    441, '2022-23', 'ug',
    386, 368, 8,
    500000, null, null,
    'nirf_disclosure', true, 'https://dsce.ac.in/wp-content/uploads/2025/11/NIRF-ENGINEERING.pdf', now()
  ),
(
    441, '2023-24', 'ug',
    458, 371, 12,
    660000, null, null,
    'nirf_disclosure', true, 'https://dsce.ac.in/wp-content/uploads/2025/11/NIRF-ENGINEERING.pdf', now()
  ),
(
    441, '2024-25', 'ug',
    520, 383, 120,
    750000, null, null,
    'nirf_disclosure', true, 'https://dsce.ac.in/wp-content/uploads/2025/11/NIRF-ENGINEERING.pdf', now()
  ),
(
    442, '2022-23', 'ug',
    58, 57, 1,
    168000, null, null,
    'nirf_disclosure', true, 'https://adithyatech.edu.in/wp-content/uploads/2026/04/AIT_NIRF_Engineering_2024.pdf', now()
  ),
(
    444, '2022-23', 'ug',
    90, 90, 0,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.svhec.com/wp-content/uploads/2026/03/NIRF.pdf', now()
  ),
(
    444, '2023-24', 'ug',
    205, 203, 2,
    270000, null, null,
    'nirf_disclosure', true, 'https://www.svhec.com/wp-content/uploads/2026/03/NIRF.pdf', now()
  ),
(
    444, '2024-25', 'ug',
    116, 115, 1,
    385000, null, null,
    'nirf_disclosure', true, 'https://www.svhec.com/wp-content/uploads/2026/03/NIRF.pdf', now()
  ),
(
    446, '2022-23', 'ug',
    32, 32, 0,
    420000, null, null,
    'nirf_disclosure', true, 'https://www.easacollege.com/assets/NIRF/Engg.pdf', now()
  ),
(
    446, '2023-24', 'ug',
    46, 45, 1,
    380000, null, null,
    'nirf_disclosure', true, 'https://www.easacollege.com/assets/NIRF/Engg.pdf', now()
  ),
(
    446, '2024-25', 'ug',
    132, 128, 4,
    370000, null, null,
    'nirf_disclosure', true, 'https://www.easacollege.com/assets/NIRF/Engg.pdf', now()
  ),
(
    448, '2022-23', 'ug',
    238, 152, 5,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.kgkite.ac.in/wp-content/uploads/2026/04/NIRF-2026-ENGINEERING.pdf', now()
  ),
(
    448, '2023-24', 'ug',
    202, 169, 16,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.kgkite.ac.in/wp-content/uploads/2026/04/NIRF-2026-ENGINEERING.pdf', now()
  ),
(
    448, '2024-25', 'ug',
    505, 387, 34,
    280000, null, null,
    'nirf_disclosure', true, 'https://www.kgkite.ac.in/wp-content/uploads/2026/04/NIRF-2026-ENGINEERING.pdf', now()
  ),
(
    451, '2022-23', 'ug',
    39, 39, 0,
    180000, null, null,
    'nirf_disclosure', true, 'https://www.nitcbe.ac.in/wp-content/uploads/2026/03/Overall-2026.pdf', now()
  ),
(
    451, '2023-24', 'ug',
    137, 133, 4,
    520000, null, null,
    'nirf_disclosure', true, 'https://www.nitcbe.ac.in/wp-content/uploads/2026/03/Overall-2026.pdf', now()
  ),
(
    451, '2024-25', 'ug',
    130, 124, 2,
    550000, null, null,
    'nirf_disclosure', true, 'https://www.nitcbe.ac.in/wp-content/uploads/2026/03/Overall-2026.pdf', now()
  ),
(
    452, '2022-23', 'ug',
    84, 72, 2,
    300000, null, null,
    'nirf_disclosure', true, 'https://jkkmct.edu.in/JKKMCT-NIRF2026.pdf', now()
  ),
(
    452, '2023-24', 'ug',
    47, 44, 0,
    240000, null, null,
    'nirf_disclosure', true, 'https://jkkmct.edu.in/JKKMCT-NIRF2026.pdf', now()
  ),
(
    452, '2024-25', 'ug',
    78, 75, 3,
    300000, null, null,
    'nirf_disclosure', true, 'https://jkkmct.edu.in/JKKMCT-NIRF2026.pdf', now()
  ),
(
    455, '2022-23', 'ug',
    133, 126, 7,
    240000, null, null,
    'nirf_disclosure', true, 'https://jit.ac.in/files/iqac/QA%20Files/NIRF/NIRF%202025/DCS_Engg.pdf', now()
  ),
(
    455, '2023-24', 'ug',
    217, 197, 15,
    300000, null, null,
    'nirf_disclosure', true, 'https://jit.ac.in/files/iqac/QA%20Files/NIRF/NIRF%202025/DCS_Engg.pdf', now()
  ),
(
    456, '2022-23', 'ug',
    64, 59, 5,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.acetcbe.edu.in/wp-content/uploads/2026/04/NIRF_2026_Overall.pdf', now()
  ),
(
    456, '2023-24', 'ug',
    121, 116, 1,
    364489, null, null,
    'nirf_disclosure', true, 'https://www.acetcbe.edu.in/wp-content/uploads/2026/04/NIRF_2026_Overall.pdf', now()
  ),
(
    456, '2024-25', 'ug',
    105, 102, 3,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.acetcbe.edu.in/wp-content/uploads/2026/04/NIRF_2026_Overall.pdf', now()
  ),
(
    463, '2022-23', 'ug',
    124, 97, 27,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.rvstcc.ac.in/wp-content/uploads/2024/12/RVS_TCC_SSR_REPORT_11072016.pdf', now()
  ),
(
    3, '2022-23', 'ug',
    1961, 1593, 165,
    750000, null, null,
    'nirf_disclosure', true, 'https://www.annauniv.edu/NIRF/Engineering_Anna%20University_09.03.2026.pdf', now()
  ),
(
    3, '2023-24', 'ug',
    1588, 1149, 189,
    800000, null, null,
    'nirf_disclosure', true, 'https://www.annauniv.edu/NIRF/Engineering_Anna%20University_09.03.2026.pdf', now()
  ),
(
    3, '2024-25', 'ug',
    2000, 1289, 116,
    750000, null, null,
    'nirf_disclosure', true, 'https://www.annauniv.edu/NIRF/Engineering_Anna%20University_09.03.2026.pdf', now()
  ),
(
    472, '2022-23', 'ug',
    112, 110, 2,
    250000, null, null,
    'nirf_disclosure', true, 'https://kcet.in/uploads/documents/kcet/national-institutional-ranking-framework-69ef231791b18.pdf', now()
  ),
(
    472, '2023-24', 'ug',
    92, 92, 0,
    250000, null, null,
    'nirf_disclosure', true, 'https://kcet.in/uploads/documents/kcet/national-institutional-ranking-framework-69ef231791b18.pdf', now()
  ),
(
    472, '2024-25', 'ug',
    128, 121, 7,
    300000, null, null,
    'nirf_disclosure', true, 'https://kcet.in/uploads/documents/kcet/national-institutional-ranking-framework-69ef231791b18.pdf', now()
  ),
(
    477, '2022-23', 'ug',
    78, 49, 4,
    120000, null, null,
    'nirf_disclosure', true, 'https://kskcet.edu.in/wp-content/uploads/2024/03/K.S.K-College-of-Engineering-and-Technology-New20240308-.pdf', now()
  ),
(
    486, '2022-23', 'ug',
    146, 126, 4,
    189000, null, null,
    'nirf_disclosure', true, 'https://sincet.ac.in/pdf/NIRF-Engineering-20241227.pdf', now()
  ),
(
    486, '2023-24', 'ug',
    131, 127, 4,
    300000, null, null,
    'nirf_disclosure', true, 'https://sincet.ac.in/pdf/NIRF-Engineering-20241227.pdf', now()
  ),
(
    492, '2022-23', 'ug',
    177, 152, 25,
    400000, null, null,
    'nirf_disclosure', true, 'https://trp.srmtrichy.edu.in/wp-content/uploads/2025/02/NIRF-2025_Engineering.pdf', now()
  ),
(
    492, '2023-24', 'ug',
    172, 166, 6,
    420000, null, null,
    'nirf_disclosure', true, 'https://trp.srmtrichy.edu.in/wp-content/uploads/2025/02/NIRF-2025_Engineering.pdf', now()
  ),
(
    495, '2022-23', 'ug',
    306, 300, 5,
    250000, null, null,
    'nirf_disclosure', true, 'https://a.storyblok.com/f/286279/x/baa449ff5b/nirf-2025.pdf', now()
  ),
(
    495, '2023-24', 'ug',
    238, 225, 5,
    300000, null, null,
    'nirf_disclosure', true, 'https://a.storyblok.com/f/286279/x/baa449ff5b/nirf-2025.pdf', now()
  ),
(
    495, '2024-25', 'ug',
    360, 200, 10,
    350000, null, null,
    'nirf_disclosure', true, 'https://a.storyblok.com/f/286279/x/baa449ff5b/nirf-2025.pdf', now()
  ),
(
    496, '2022-23', 'ug',
    291, 253, 14,
    370000, null, null,
    'nirf_disclosure', true, 'https://aec.org.in/wp-content/uploads/2025/02/NIRF25-Overall.pdf', now()
  ),
(
    496, '2023-24', 'ug',
    163, 157, 5,
    240000, null, null,
    'nirf_disclosure', true, 'https://aec.org.in/wp-content/uploads/2025/02/NIRF25-Overall.pdf', now()
  ),
(
    497, '2022-23', 'ug',
    844, 600, 10,
    270000, null, null,
    'nirf_disclosure', true, 'https://dsengg.ac.in/uploads/nrif/nirf_DSEC_Engineering_NIRF_2026.pdf', now()
  ),
(
    497, '2023-24', 'ug',
    776, 758, 18,
    450000, null, null,
    'nirf_disclosure', true, 'https://dsengg.ac.in/uploads/nrif/nirf_DSEC_Engineering_NIRF_2026.pdf', now()
  ),
(
    497, '2024-25', 'ug',
    912, 888, 24,
    550000, null, null,
    'nirf_disclosure', true, 'https://dsengg.ac.in/uploads/nrif/nirf_DSEC_Engineering_NIRF_2026.pdf', now()
  ),
(
    502, '2022-23', 'ug',
    115, 69, 7,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.mamce.org/public/images/Mamce-NIRF.pdf', now()
  ),
(
    502, '2023-24', 'ug',
    198, 98, 15,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.mamce.org/public/images/Mamce-NIRF.pdf', now()
  ),
(
    503, '2022-23', 'ug',
    311, 201, 45,
    192000, null, null,
    'nirf_disclosure', true, 'https://www.miet.edu/pdf2/Over%20All%202026%20(2024-25).pdf', now()
  ),
(
    503, '2023-24', 'ug',
    208, 200, 8,
    425000, null, null,
    'nirf_disclosure', true, 'https://www.miet.edu/pdf2/Over%20All%202026%20(2024-25).pdf', now()
  ),
(
    503, '2024-25', 'ug',
    225, 220, 5,
    450000, null, null,
    'nirf_disclosure', true, 'https://www.miet.edu/pdf2/Over%20All%202026%20(2024-25).pdf', now()
  ),
(
    509, '2022-23', 'ug',
    565, 329, 9,
    336000, null, null,
    'nirf_disclosure', true, 'https://saranathan.ac.in/nirf/2024-2025/Saranathan%20College%20of%20Engineering20250108%20Engg.pdf', now()
  ),
(
    509, '2023-24', 'ug',
    427, 150, 10,
    350000, null, null,
    'nirf_disclosure', true, 'https://saranathan.ac.in/nirf/2024-2025/Saranathan%20College%20of%20Engineering20250108%20Engg.pdf', now()
  ),
(
    513, '2022-23', 'ug',
    60, 45, 5,
    250000, null, null,
    'nirf_disclosure', true, 'https://sjcettnj.edu.in/docs/Engineering.pdf', now()
  ),
(
    513, '2023-24', 'ug',
    70, 64, 6,
    300000, null, null,
    'nirf_disclosure', true, 'https://sjcettnj.edu.in/docs/Engineering.pdf', now()
  ),
(
    513, '2024-25', 'ug',
    52, 40, 2,
    330000, null, null,
    'nirf_disclosure', true, 'https://sjcettnj.edu.in/docs/Engineering.pdf', now()
  ),
(
    515, '2022-23', 'ug',
    170, 170, 0,
    300000, null, null,
    'nirf_disclosure', true, 'http://mamcet.com/wp-content/uploads/2026/04/M.-A.-M.-College-of-Engineering-and-Technology20260306-.pdf', now()
  ),
(
    515, '2023-24', 'ug',
    96, 89, 7,
    360000, null, null,
    'nirf_disclosure', true, 'http://mamcet.com/wp-content/uploads/2026/04/M.-A.-M.-College-of-Engineering-and-Technology20260306-.pdf', now()
  ),
(
    515, '2024-25', 'ug',
    111, 101, 5,
    360000, null, null,
    'nirf_disclosure', true, 'http://mamcet.com/wp-content/uploads/2026/04/M.-A.-M.-College-of-Engineering-and-Technology20260306-.pdf', now()
  ),
(
    520, '2022-23', 'ug',
    156, 119, 1,
    180000, null, null,
    'nirf_disclosure', true, 'https://mrkit.edu.in/assets/pdf/nirf/nirf-2024.pdf', now()
  ),
(
    523, '2022-23', 'ug',
    55, 40, 15,
    219000, null, null,
    'nirf_disclosure', true, 'https://www.mtcet.in/assets/img/AICTE/NIRF2026.pdf', now()
  ),
(
    523, '2023-24', 'ug',
    39, 28, 5,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.mtcet.in/assets/img/AICTE/NIRF2026.pdf', now()
  ),
(
    523, '2024-25', 'ug',
    52, 46, 4,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.mtcet.in/assets/img/AICTE/NIRF2026.pdf', now()
  ),
(
    532, '2022-23', 'ug',
    49, 44, 0,
    170400, null, null,
    'nirf_disclosure', true, 'https://www.stannescet.ac.in/media/files/SANCET-NIRF-2026.pdf', now()
  ),
(
    532, '2023-24', 'ug',
    42, 39, 3,
    180000, null, null,
    'nirf_disclosure', true, 'https://www.stannescet.ac.in/media/files/SANCET-NIRF-2026.pdf', now()
  ),
(
    532, '2024-25', 'ug',
    58, 52, 2,
    216900, null, null,
    'nirf_disclosure', true, 'https://www.stannescet.ac.in/media/files/SANCET-NIRF-2026.pdf', now()
  ),
(
    533, '2022-23', 'ug',
    89, 88, 1,
    380000, null, null,
    'nirf_disclosure', true, 'https://www.kingsengg.edu.in/pdf/main/NIRF-25-26.pdf', now()
  ),
(
    533, '2023-24', 'ug',
    113, 110, 2,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.kingsengg.edu.in/pdf/main/NIRF-25-26.pdf', now()
  ),
(
    533, '2024-25', 'ug',
    146, 144, 1,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.kingsengg.edu.in/pdf/main/NIRF-25-26.pdf', now()
  ),
(
    534, '2022-23', 'ug',
    173, 173, 0,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.mzcet.in/assets/nirf.pdf', now()
  ),
(
    534, '2023-24', 'ug',
    164, 153, 11,
    216000, null, null,
    'nirf_disclosure', true, 'https://www.mzcet.in/assets/nirf.pdf', now()
  ),
(
    534, '2024-25', 'ug',
    226, 222, 4,
    234000, null, null,
    'nirf_disclosure', true, 'https://www.mzcet.in/assets/nirf.pdf', now()
  ),
(
    535, '2022-23', 'ug',
    83, 77, 3,
    200000, null, null,
    'nirf_disclosure', true, 'https://snec.ac.in/assets/pdf/nirf1.pdf', now()
  ),
(
    535, '2023-24', 'ug',
    70, 60, 2,
    200000, null, null,
    'nirf_disclosure', true, 'https://snec.ac.in/assets/pdf/nirf1.pdf', now()
  ),
(
    535, '2024-25', 'ug',
    92, 72, 0,
    200000, null, null,
    'nirf_disclosure', true, 'https://snec.ac.in/assets/pdf/nirf1.pdf', now()
  ),
(
    540, '2022-23', 'ug',
    326, 116, 76,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.ucen.ac.in/docs/common/University%20College%20of%20Engineering%20Nagercoil20260316-2026.pdf', now()
  ),
(
    540, '2023-24', 'ug',
    378, 197, 134,
    220000, null, null,
    'nirf_disclosure', true, 'https://www.ucen.ac.in/docs/common/University%20College%20of%20Engineering%20Nagercoil20260316-2026.pdf', now()
  ),
(
    540, '2024-25', 'ug',
    372, 216, 119,
    644166, null, null,
    'nirf_disclosure', true, 'https://www.ucen.ac.in/docs/common/University%20College%20of%20Engineering%20Nagercoil20260316-2026.pdf', now()
  ),
(
    543, '2022-23', 'ug',
    460, 408, 31,
    216000, null, null,
    'nirf_disclosure', true, 'https://www.rcet.org.in/uploads/files/NIRF/Overall/NIRF%20OVERALL%202024-2025.pdf', now()
  ),
(
    543, '2023-24', 'ug',
    450, 379, 45,
    225000, null, null,
    'nirf_disclosure', true, 'https://www.rcet.org.in/uploads/files/NIRF/Overall/NIRF%20OVERALL%202024-2025.pdf', now()
  ),
(
    543, '2024-25', 'ug',
    510, 450, 50,
    250000, null, null,
    'nirf_disclosure', true, 'https://www.rcet.org.in/uploads/files/NIRF/Overall/NIRF%20OVERALL%202024-2025.pdf', now()
  ),
(
    545, '2022-23', 'ug',
    129, 119, 10,
    200000, null, null,
    'nirf_disclosure', true, 'https://smcoeerp-docs.s3.ap-south-1.amazonaws.com/websitedocs/naac/13/12454?response-content-type=application%2Fpdf&response-content-disposition=inline%3B%20filename%3D%22NIRF2026.pdf%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXMYLEXS5TA6ILDQG%2F20260720%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20260720T151700Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=554ca7131957b0416c79ede22d4eca11b46944b3c600ea447f2c90fb57755c2d', now()
  ),
(
    545, '2023-24', 'ug',
    110, 98, 12,
    192000, null, null,
    'nirf_disclosure', true, 'https://smcoeerp-docs.s3.ap-south-1.amazonaws.com/websitedocs/naac/13/12454?response-content-type=application%2Fpdf&response-content-disposition=inline%3B%20filename%3D%22NIRF2026.pdf%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXMYLEXS5TA6ILDQG%2F20260720%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20260720T151700Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=554ca7131957b0416c79ede22d4eca11b46944b3c600ea447f2c90fb57755c2d', now()
  ),
(
    545, '2024-25', 'ug',
    171, 159, 6,
    219000, null, null,
    'nirf_disclosure', true, 'https://smcoeerp-docs.s3.ap-south-1.amazonaws.com/websitedocs/naac/13/12454?response-content-type=application%2Fpdf&response-content-disposition=inline%3B%20filename%3D%22NIRF2026.pdf%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXMYLEXS5TA6ILDQG%2F20260720%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20260720T151700Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=554ca7131957b0416c79ede22d4eca11b46944b3c600ea447f2c90fb57755c2d', now()
  ),
(
    554, '2022-23', 'ug',
    1040, 902, 45,
    280000, null, null,
    'nirf_disclosure', true, 'https://sethu.ac.in/wp-content/uploads/2026/04/NIRF-25-Engineering-SIT.pdf', now()
  ),
(
    554, '2023-24', 'ug',
    989, 920, 30,
    300000, null, null,
    'nirf_disclosure', true, 'https://sethu.ac.in/wp-content/uploads/2026/04/NIRF-25-Engineering-SIT.pdf', now()
  ),
(
    554, '2024-25', 'ug',
    950, 910, 39,
    300000, null, null,
    'nirf_disclosure', true, 'https://sethu.ac.in/wp-content/uploads/2026/04/NIRF-25-Engineering-SIT.pdf', now()
  ),
(
    565, '2022-23', 'ug',
    29, 25, 3,
    200000, null, null,
    'nirf_disclosure', true, 'https://uitkovilpatti.ac.in/Files/NIRF.pdf', now()
  ),
(
    565, '2023-24', 'ug',
    19, 15, 4,
    200000, null, null,
    'nirf_disclosure', true, 'https://uitkovilpatti.ac.in/Files/NIRF.pdf', now()
  ),
(
    567, '2022-23', 'ug',
    317, 235, 82,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.arunachalacollege.com/pdf/nirf2025.pdf', now()
  ),
(
    567, '2023-24', 'ug',
    261, 198, 63,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.arunachalacollege.com/pdf/nirf2025.pdf', now()
  ),
(
    571, '2022-23', 'ug',
    66, 32, 30,
    210000, null, null,
    'nirf_disclosure', true, 'https://www.csiit.ac.in/wp-content/uploads/2026/05/NIRF-DCS-ENGINEERING-2026.pdf', now()
  ),
(
    571, '2023-24', 'ug',
    10, 6, 2,
    213333, null, null,
    'nirf_disclosure', true, 'https://www.csiit.ac.in/wp-content/uploads/2026/05/NIRF-DCS-ENGINEERING-2026.pdf', now()
  ),
(
    571, '2024-25', 'ug',
    35, 27, 8,
    220000, null, null,
    'nirf_disclosure', true, 'https://www.csiit.ac.in/wp-content/uploads/2026/05/NIRF-DCS-ENGINEERING-2026.pdf', now()
  ),
(
    574, '2022-23', 'ug',
    491, 457, 31,
    380000, null, null,
    'nirf_disclosure', true, 'https://francisxavier.ac.in/cs-content/uploads/nirf/2026/NIRF_OVERALL.pdf', now()
  ),
(
    574, '2023-24', 'ug',
    606, 547, 37,
    380000, null, null,
    'nirf_disclosure', true, 'https://francisxavier.ac.in/cs-content/uploads/nirf/2026/NIRF_OVERALL.pdf', now()
  ),
(
    574, '2024-25', 'ug',
    695, 589, 56,
    400000, null, null,
    'nirf_disclosure', true, 'https://francisxavier.ac.in/cs-content/uploads/nirf/2026/NIRF_OVERALL.pdf', now()
  ),
(
    586, '2022-23', 'ug',
    155, 142, 7,
    250000, null, null,
    'nirf_disclosure', true, 'https://scadengineering.ac.in/wp-content/uploads/2025/02/SCAD-College-of-Engineering-and-Technology20250130-Overall.pdf', now()
  ),
(
    586, '2023-24', 'ug',
    64, 64, 0,
    250000, null, null,
    'nirf_disclosure', true, 'https://scadengineering.ac.in/wp-content/uploads/2025/02/SCAD-College-of-Engineering-and-Technology20250130-Overall.pdf', now()
  ),
(
    587, '2022-23', 'ug',
    52, 46, 0,
    180000, null, null,
    'nirf_disclosure', true, 'https://www.sowdambikaengg.edu.in/NIRF26.pdf', now()
  ),
(
    587, '2023-24', 'ug',
    54, 54, 0,
    180000, null, null,
    'nirf_disclosure', true, 'https://www.sowdambikaengg.edu.in/NIRF26.pdf', now()
  ),
(
    587, '2024-25', 'ug',
    45, 40, 5,
    196000, null, null,
    'nirf_disclosure', true, 'https://www.sowdambikaengg.edu.in/NIRF26.pdf', now()
  ),
(
    589, '2022-23', 'ug',
    202, 192, 10,
    380000, null, null,
    'nirf_disclosure', true, 'https://amrita.edu.in/docs/AY23-24/NIRF2024_OVERALL.pdf', now()
  ),
(
    590, '2022-23', 'ug',
    411, 158, 19,
    400000, null, null,
    'nirf_disclosure', true, 'https://www.gcetly.ac.in/nirf/nirf2026_engineering.pdf', now()
  ),
(
    590, '2023-24', 'ug',
    403, 169, 24,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.gcetly.ac.in/nirf/nirf2026_engineering.pdf', now()
  ),
(
    590, '2024-25', 'ug',
    414, 212, 18,
    340000, null, null,
    'nirf_disclosure', true, 'https://www.gcetly.ac.in/nirf/nirf2026_engineering.pdf', now()
  ),
(
    598, '2022-23', 'ug',
    48, 35, 0,
    240000, null, null,
    'nirf_disclosure', true, 'https://vinsengineeringcollege.org/includes/documents/nirf.pdf', now()
  ),
(
    598, '2023-24', 'ug',
    108, 50, 0,
    240000, null, null,
    'nirf_disclosure', true, 'https://vinsengineeringcollege.org/includes/documents/nirf.pdf', now()
  ),
(
    601, '2022-23', 'ug',
    50, 50, 0,
    140000, null, null,
    'nirf_disclosure', true, 'https://www.psnec.ac.in/NIRF.pdf', now()
  ),
(
    601, '2023-24', 'ug',
    19, 9, 0,
    140000, null, null,
    'nirf_disclosure', true, 'https://www.psnec.ac.in/NIRF.pdf', now()
  ),
(
    601, '2024-25', 'ug',
    44, 8, 0,
    140000, null, null,
    'nirf_disclosure', true, 'https://www.psnec.ac.in/NIRF.pdf', now()
  ),
(
    603, '2022-23', 'ug',
    168, 137, 10,
    170000, null, null,
    'nirf_disclosure', true, 'https://www.lites.edu.in/portal/nirf/LITES-IR-O-C-27087-NIRF-2024-OVERALL-REPORT.pdf', now()
  ),
(
    609, '2022-23', 'ug',
    834, 693, 51,
    651000, null, null,
    'nirf_disclosure', true, 'https://www.tce.edu/sites/default/files/PDF/NIRF-2026-Overall.pdf', now()
  ),
(
    609, '2023-24', 'ug',
    870, 692, 58,
    720000, null, null,
    'nirf_disclosure', true, 'https://www.tce.edu/sites/default/files/PDF/NIRF-2026-Overall.pdf', now()
  ),
(
    609, '2024-25', 'ug',
    849, 710, 46,
    745000, null, null,
    'nirf_disclosure', true, 'https://www.tce.edu/sites/default/files/PDF/NIRF-2026-Overall.pdf', now()
  ),
(
    615, '2022-23', 'ug',
    52, 43, 9,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.sriraajaraajan.in/img/need/SRRCET%20-%20NIRF%20DCS%20REPORT.pdf', now()
  ),
(
    615, '2023-24', 'ug',
    44, 32, 12,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.sriraajaraajan.in/img/need/SRRCET%20-%20NIRF%20DCS%20REPORT.pdf', now()
  ),
(
    615, '2024-25', 'ug',
    88, 79, 9,
    320000, null, null,
    'nirf_disclosure', true, 'https://www.sriraajaraajan.in/img/need/SRRCET%20-%20NIRF%20DCS%20REPORT.pdf', now()
  ),
(
    619, '2022-23', 'ug',
    113, 100, 11,
    300000, null, null,
    'nirf_disclosure', true, 'https://mce-madurai.ac.in/wp-content/uploads/2026/04/MANGAYARKARASI-COLLEGE-OF-ENGINEERING20260220-1-1.pdf', now()
  ),
(
    619, '2023-24', 'ug',
    187, 154, 16,
    300000, null, null,
    'nirf_disclosure', true, 'https://mce-madurai.ac.in/wp-content/uploads/2026/04/MANGAYARKARASI-COLLEGE-OF-ENGINEERING20260220-1-1.pdf', now()
  ),
(
    619, '2024-25', 'ug',
    182, 89, 21,
    300000, null, null,
    'nirf_disclosure', true, 'https://mce-madurai.ac.in/wp-content/uploads/2026/04/MANGAYARKARASI-COLLEGE-OF-ENGINEERING20260220-1-1.pdf', now()
  ),
(
    625, '2022-23', 'ug',
    191, 187, 4,
    240000, null, null,
    'nirf_disclosure', true, 'http://nprcolleges.org/engineering/wp-content/uploads/sites/2/2025/08/nirf_2024-2025.pdf', now()
  ),
(
    625, '2023-24', 'ug',
    186, 186, 0,
    310000, null, null,
    'nirf_disclosure', true, 'http://nprcolleges.org/engineering/wp-content/uploads/sites/2/2025/08/nirf_2024-2025.pdf', now()
  ),
(
    630, '2022-23', 'ug',
    133, 86, 6,
    240000, null, null,
    'nirf_disclosure', true, 'https://www.nscet.org/assets/pdf/NIRF/IR-E-C-56319%20ENGG%2025%20(1).pdf', now()
  ),
(
    630, '2023-24', 'ug',
    138, 98, 4,
    199992, null, null,
    'nirf_disclosure', true, 'https://www.nscet.org/assets/pdf/NIRF/IR-E-C-56319%20ENGG%2025%20(1).pdf', now()
  ),
(
    630, '2024-25', 'ug',
    167, 135, 7,
    252000, null, null,
    'nirf_disclosure', true, 'https://www.nscet.org/assets/pdf/NIRF/IR-E-C-56319%20ENGG%2025%20(1).pdf', now()
  ),
(
    634, '2022-23', 'ug',
    157, 122, 6,
    350000, null, null,
    'nirf_disclosure', true, 'https://www.msec.org.in/uploads/nirf/2025-ENGG.pdf', now()
  ),
(
    634, '2023-24', 'ug',
    184, 140, 33,
    550000, null, null,
    'nirf_disclosure', true, 'https://www.msec.org.in/uploads/nirf/2025-ENGG.pdf', now()
  ),
(
    634, '2024-25', 'ug',
    218, 76, 22,
    420000, null, null,
    'nirf_disclosure', true, 'https://www.msec.org.in/uploads/nirf/2025-ENGG.pdf', now()
  ),
(
    637, '2022-23', 'ug',
    112, 84, 14,
    140000, null, null,
    'nirf_disclosure', true, 'https://www.psyec.edu.in/assets/img/brochures/DCS-NIRF.pdf', now()
  ),
(
    637, '2023-24', 'ug',
    131, 65, 15,
    150000, null, null,
    'nirf_disclosure', true, 'https://www.psyec.edu.in/assets/img/brochures/DCS-NIRF.pdf', now()
  ),
(
    637, '2024-25', 'ug',
    129, 58, 13,
    200000, null, null,
    'nirf_disclosure', true, 'https://www.psyec.edu.in/assets/img/brochures/DCS-NIRF.pdf', now()
  ),
(
    638, '2022-23', 'ug',
    54, 36, 8,
    150000, null, null,
    'nirf_disclosure', true, 'https://rvseng.ac.in/wp-content/uploads/2025/09/RVSCE-NIRF-OVERALL-REPORT.pdf', now()
  ),
(
    638, '2023-24', 'ug',
    161, 89, 42,
    180000, null, null,
    'nirf_disclosure', true, 'https://rvseng.ac.in/wp-content/uploads/2025/09/RVSCE-NIRF-OVERALL-REPORT.pdf', now()
  ),
(
    642, '2022-23', 'ug',
    138, 114, 4,
    266950, null, null,
    'nirf_disclosure', true, 'https://www.syedengg.ac.in/pdf/NIRF/report/NIRF-2026-ENGINEERING.pdf', now()
  ),
(
    642, '2023-24', 'ug',
    94, 64, 0,
    245000, null, null,
    'nirf_disclosure', true, 'https://www.syedengg.ac.in/pdf/NIRF/report/NIRF-2026-ENGINEERING.pdf', now()
  ),
(
    642, '2024-25', 'ug',
    161, 145, 12,
    712714, null, null,
    'nirf_disclosure', true, 'https://www.syedengg.ac.in/pdf/NIRF/report/NIRF-2026-ENGINEERING.pdf', now()
  ),
(
    647, '2022-23', 'ug',
    436, 347, 21,
    491648, null, null,
    'nirf_disclosure', true, 'https://www.vcet.ac.in/vcetit/pdfs/IQAC/NIRF/Engineering2026.pdf', now()
  ),
(
    647, '2023-24', 'ug',
    406, 307, 28,
    378210, null, null,
    'nirf_disclosure', true, 'https://www.vcet.ac.in/vcetit/pdfs/IQAC/NIRF/Engineering2026.pdf', now()
  ),
(
    647, '2024-25', 'ug',
    489, 394, 21,
    400250, null, null,
    'nirf_disclosure', true, 'https://www.vcet.ac.in/vcetit/pdfs/IQAC/NIRF/Engineering2026.pdf', now()
  ),
(
    649, '2022-23', 'ug',
    25, 21, 4,
    204000, null, null,
    'nirf_disclosure', true, 'https://www.lathamathavan.edu.in/wp-content/uploads/2026/04/NIRF-2024-25_REPORT.pdf', now()
  ),
(
    649, '2023-24', 'ug',
    53, 49, 3,
    300000, null, null,
    'nirf_disclosure', true, 'https://www.lathamathavan.edu.in/wp-content/uploads/2026/04/NIRF-2024-25_REPORT.pdf', now()
  ),
(
    649, '2024-25', 'ug',
    86, 50, 4,
    250000, null, null,
    'nirf_disclosure', true, 'https://www.lathamathavan.edu.in/wp-content/uploads/2026/04/NIRF-2024-25_REPORT.pdf', now()
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

-- Source: data/imports/college-official-links.sql

begin;

insert into public.college_official_links (
  college_id, official_website, admissions_url, placements_url,
  mandatory_disclosure_url, nirf_disclosure_url, contact_url,
  verification_status, source_url, last_verified_at
)
values
(
    1, 'https://ceg.annauniv.edu/',
    null, null,
    null, null,
    null, 'pending', 'https://ceg.annauniv.edu/', now()
  ),
(
    176, 'https://www.aucet.in/',
    'https://www.aucet.in/home/res/forms/FDP.pdf', 'https://www.aucet.in/',
    'https://www.aucet.in/home/res/disclosure.pdf', 'https://www.aucet.in/',
    null, 'pending', 'https://www.aucet.in/', now()
  ),
(
    177, 'https://www.aucearni.in/',
    'https://www.aucearni.in/Readmission%20Application%20Odd%20sem%20-%202026-27.pdf', 'https://www.aucearni.in/placement.php',
    'https://www.aucearni.in/UCE%20Arni%20AICTE%20MANDATORY%20DISCLOSURE%202026-2027.pdf', 'https://www.annauniv.edu/nirf.php',
    'https://www.aucearni.in/contact.php', 'pending', 'https://www.aucearni.in/', now()
  ),
(
    178, 'http://www.aucek.in/',
    'http://www.aucek.in/assets/Admission%20instruction_BE_EEE_ti.pdf', 'http://www.aucek.in/placement.html',
    'https://drive.google.com/file/d/1C5nQyLqquXvkWzo9HioPzsK43a-k8qJD/view?usp=sharing', null,
    'http://www.aucek.in/contact.html', 'pending', 'http://www.aucek.in/', now()
  ),
(
    179, 'https://aalimec.ac.in/',
    'https://aalimec.ac.in/admission/#form', 'https://aalimec.ac.in/placement/',
    'https://aalimec.ac.in/mandatorydisclosure/', 'https://aalimec.ac.in/#',
    'https://aalimec.ac.in/contact/', 'pending', 'https://aalimec.ac.in/', now()
  ),
(
    180, 'https://jec.ac.in/',
    'mailto:admission@jec.ac.in', 'https://jec.ac.in/wp-content/uploads/2025/02/TRAINING-PLACEMENT-POLICY.pdf',
    'https://jec.ac.in/wp-content/uploads/2025/08/Mandatory-disclosure.pdf', 'https://jec.ac.in/wp-content/uploads/2024/03/NIRF24-DCS.pdf',
    'https://jec.ac.in/wp-content/uploads/2025/02/CODE-OF-CONTACT-POLICY.pdf', 'pending', 'https://jec.ac.in/', now()
  ),
(
    181, 'https://www.jitcollege.edu.in/',
    'https://www.jitcollege.edu.in/admission.php', null,
    'https://www.jitcollege.edu.in/assets/pdf/JIT_Mandatory_Disclosure_2025_Completed.pdf', null,
    'https://www.jitcollege.edu.in/contact.php', 'pending', 'https://www.jitcollege.edu.in/', now()
  ),
(
    182, 'https://prathyusha.edu.in/',
    'https://prathyusha.edu.in/#', 'https://prathyusha.edu.in/placements/',
    'https://prathyusha.edu.in/wp-content/uploads/2025/downloads/PEC-MANDATORY-DISCLOSURE-2025-26.pdf', 'https://prathyusha.edu.in/nirf-new/',
    'https://prathyusha.edu.in/contact-us/', 'pending', 'https://prathyusha.edu.in/', now()
  ),
(
    183, 'https://www.rmd.ac.in/',
    'https://rmkec.ac.in/admission2024/sendotp1.php', 'https://www.rmd.ac.in/#',
    'https://www.rmd.ac.in/#', 'https://www.rmd.ac.in/nirf/nirf.html',
    'https://www.rmd.ac.in/contact.html', 'pending', 'https://www.rmd.ac.in/', now()
  ),
(
    184, 'https://www.rmkec.ac.in/2023/',
    'https://www.rmkec.ac.in/2023/administration/admission-procedure/', 'https://www.rmkec.ac.in/2023/administration/dean/',
    'https://www.rmkec.ac.in/2023/accreditation/nirf/nirf-disclosure/', 'https://www.rmkec.ac.in/2023/accreditation/nirf/nirf-disclosure/',
    'https://www.rmkec.ac.in/2023/#', 'pending', 'https://www.rmkec.ac.in/2023/', now()
  ),
(
    185, 'https://www.saec.ac.in/',
    'https://www.saec.ac.in/admissions.php', 'https://www.saec.ac.in/placement.php',
    'https://www.saec.ac.in/mandatory-disclosure.php', 'https://www.saec.ac.in/nirf.php',
    'https://www.saec.ac.in/contact.php', 'pending', 'https://www.saec.ac.in/', now()
  ),
(
    187, 'https://www.sriventech.ac.in/',
    'https://www.sriventech.ac.in/#', 'https://www.sriventech.ac.in/placement-and-training-cell.php',
    'https://www.sriventech.ac.in/assets/files/Mandatory-Disclosure-2025-2026.pdf', null,
    'https://www.sriventech.ac.in/contact.php', 'pending', 'https://www.sriventech.ac.in/', now()
  ),
(
    188, 'https://www.veltechmultitech.org/',
    'https://www.veltechmultitech.org/admission/', 'https://www.veltechmultitech.org/placements/',
    'https://www.veltechmultitech.org/mandatory-disclosure/', 'https://www.veltechmultitech.org/nirf/',
    null, 'pending', 'https://www.veltechmultitech.org/', now()
  ),
(
    190, 'https://www.sverct.in/',
    null, null,
    null, null,
    'https://www.sverct.in/contact', 'pending', 'https://www.sverct.in/', now()
  ),
(
    191, 'https://www.velhightech.com/',
    'https://www.velhightech.com/admission-procedure.php', 'https://www.velhightech.com/#',
    'https://www.velhightech.com/single_page.php?id=NP-13&mid=MID-2&sid=SID-34', 'https://www.velhightech.com/single_page.php?id=NP-165',
    'https://www.velhightech.com/contact.php', 'pending', 'https://www.velhightech.com/', now()
  ),
(
    192, 'https://www.gojaneducation.tech/',
    null, null,
    null, null,
    null, 'pending', 'https://www.gojaneducation.tech/', now()
  ),
(
    193, 'https://www.samsmarine.org/',
    'https://www.samsmarine.org/application/', 'https://www.samsmarine.org/#',
    null, null,
    'https://www.samsmarine.org/contact/contact.php', 'pending', 'https://www.samsmarine.org/', now()
  ),
(
    195, 'https://www.jnn.edu.in/',
    'https://apply.jnn.edu.in/', 'https://www.jnn.edu.in/placement/',
    null, 'https://www.jnn.edu.in/nirf/',
    'https://www.jnn.edu.in/contact/', 'pending', 'https://www.jnn.edu.in/', now()
  ),
(
    196, 'https://www.spcet.ac.in/',
    'https://www.spcet.ac.in/contactus.php', 'https://www.spcet.ac.in/placement.php',
    'https://www.spcet.ac.in/md.pdf', 'https://www.spcet.ac.in/nirf.php',
    'https://www.spcet.ac.in/contactus.php', 'pending', 'https://www.spcet.ac.in/', now()
  ),
(
    197, 'https://www.rmkcet.ac.in/',
    'https://www.rmkcet.ac.in/adm_admissionprocedure.php', 'https://www.rmkcet.ac.in/placement.php',
    'https://www.rmkcet.ac.in/mandatory-disclosure.php', 'https://www.rmkcet.ac.in/nirf.php',
    'https://www.rmkcet.ac.in/contact-us.php', 'pending', 'https://www.rmkcet.ac.in/', now()
  ),
(
    198, 'https://jayaarchitecture.com/',
    'https://jayaarchitecture.com/admission/', null,
    null, null,
    'https://jayaarchitecture.com/contact-us/', 'pending', 'https://jayaarchitecture.com/', now()
  ),
(
    202, 'https://amsarch.ac.in/',
    'https://amsarch.ac.in/admission/', 'https://amsarch.ac.in/placements/',
    null, null,
    'https://amsarch.ac.in/contact-us/', 'pending', 'https://amsarch.ac.in/', now()
  ),
(
    203, 'https://amcet.in/',
    'http://202.170.204.125/AMCWEB/dist/create-enquiry/2', 'https://amcet.in/wp-content/uploads/2024/07/placement-23-24.pdf',
    null, null,
    'https://amcet.in/contact-us/', 'pending', 'https://amcet.in/', now()
  ),
(
    205, 'https://www.jeppiaarinstitute.org/',
    'https://www.jeppiaarinstitute.org/#', 'https://www.jeppiaarinstitute.org/training-placement-cell/',
    'https://www.jeppiaarinstitute.org/Mandatory%20Disclosure', 'https://www.jeppiaarinstitute.org/nirf/',
    'https://www.jeppiaarinstitute.org/contact/', 'pending', 'https://www.jeppiaarinstitute.org/', now()
  ),
(
    206, 'https://rvschennai.edu.in/',
    'https://rvschennai.edu.in/b-arch-course/', null,
    null, null,
    'https://rvschennai.edu.in/contact/', 'pending', 'https://rvschennai.edu.in/', now()
  ),
(
    208, 'https://mnmjsa.ac.in/',
    'https://mnmjsa.ac.in/admission-open/', null,
    null, null,
    'https://mnmjsa.ac.in/contact/', 'pending', 'https://mnmjsa.ac.in/', now()
  ),
(
    210, 'https://www.stjosephstechnology.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.stjosephstechnology.ac.in/', now()
  ),
(
    211, 'https://www.sjiet.org/',
    'https://www.sjiet.org/admission-requirement.php', 'https://www.sjiet.org/placement-cell.php',
    'https://www.sjiet.org/mandatory-disclosure-2025-2026.php', 'https://www.sjiet.org/nirf.php',
    'https://www.sjiet.org/contactus.php', 'pending', 'https://www.sjiet.org/', now()
  ),
(
    212, 'https://www.caad.ac.in/',
    'https://www.caad.ac.in/admissions.php#apply', 'https://www.caad.ac.in/placement.php',
    'https://www.caad.ac.in/Mandatory-disclosure.php', null,
    'https://www.caad.ac.in/contact.php', 'pending', 'https://www.caad.ac.in/', now()
  ),
(
    213, 'https://dmice.ac.in/',
    'https://admissions.dmifoundations.org/eng-application-form-2026-2027', 'https://forms.gle/ogyBX1dVUQJrTzpB9',
    'https://dmice.ac.in/wp-content/uploads/2023/03/Mandatory-Disclosure-5-6.pdf', null,
    'https://dmice.ac.in/#', 'pending', 'https://dmice.ac.in/', now()
  ),
(
    214, 'https://www.kingsedu.ac.in/',
    'https://www.kingsedu.ac.in/admission-enquiry/', 'https://www.kingsedu.ac.in/placements/',
    'https://www.kingsedu.ac.in/mandatory-guidelines/', 'https://kingsedu-assets.in-maa-1.linodeobjects.com/nirf/NIRF-KEC.pdf',
    'https://www.kingsedu.ac.in/contact/', 'pending', 'https://www.kingsedu.ac.in/', now()
  ),
(
    216, 'https://www.panimalar.ac.in/',
    'https://www.panimalar.ac.in/documents-submitted-for-the-deemed-to-be-university-application.php', 'https://www.panimalar.ac.in/placement.php',
    'https://www.panimalar.ac.in/assets/pdf/MANDATORY-DISCLOSURE.pdf', 'https://www.panimalar.ac.in/#',
    'https://www.panimalar.ac.in/contact-us.php', 'pending', 'https://www.panimalar.ac.in/', now()
  ),
(
    217, 'http://www.rajalakshmi.edu.in/',
    'http://www.rajalakshmi.edu.in/#', 'http://www.rajalakshmi.org/#',
    'http://www.rajalakshmi.org/profile-mandatory.php', 'http://www.rajalakshmi.edu.in/downloads/NIRF_2019_WEBSITE_UPLOAD_REC.pdf',
    'http://www.rajalakshmi.edu.in/contact-us.php', 'pending', 'http://www.rajalakshmi.edu.in/', now()
  ),
(
    218, 'https://rgei.ac.in/',
    'https://rgei.ac.in/admissions.php', 'https://rgei.ac.in/placement-cell.php',
    'https://rgei.ac.in/#', null,
    'https://rgei.ac.in/contact.php', 'pending', 'https://rgei.ac.in/', now()
  ),
(
    220, 'https://saveetha.ac.in/',
    'mailto:admission@saveetha.ac.in', 'https://saveetha.ac.in/placement/',
    'https://saveetha.ac.in/wp-content/uploads/2026/01/AICTE-MANDATORY-DISCLOSURE1.pdf', 'https://saveetha.ac.in/wp-content/uploads/2026/02/SAVEETHA-ENGINEERING-COLLEGE20260216-.pdf',
    null, 'pending', 'https://saveetha.ac.in/', now()
  ),
(
    221, 'https://sasthainstitutions.in/',
    'https://sasthainstitutions.in/admission2025-2026/', 'https://sasthainstitutions.in/placements/',
    'https://sasthainstitutions.in/#', 'https://sasthainstitutions.in/nirf/',
    'https://sasthainstitutions.in/contact-us/', 'pending', 'https://sasthainstitutions.in/', now()
  ),
(
    222, 'https://smit.edu.in/',
    'https://smit.edu.in/#', 'https://smit.edu.in/placement/',
    'https://smit.edu.in/mandatory-disclosure/', 'https://smit.edu.in/nrif-rankings/',
    null, 'pending', 'https://smit.edu.in/', now()
  ),
(
    223, 'https://www.svce.ac.in/',
    'https://www.svce.ac.in/admission/', 'https://www.svce.ac.in/placement/',
    'https://www.svce.ac.in/[php]%20echo%20wp_upload_dir()[', 'https://www.svce.ac.in/accreditation/nirf/',
    'https://www.svce.ac.in/placement/?page=contact', 'pending', 'https://www.svce.ac.in/', now()
  ),
(
    225, 'https://www.pbce.in/',
    'https://www.pbce.in/#', 'https://www.pbce.in/#',
    null, null,
    'https://www.pbce.in/contact.html', 'pending', 'https://www.pbce.in/', now()
  ),
(
    226, 'http://www.litedu.in/',
    null, null,
    null, null,
    'https://www.mydomaincontact.com/?domain_name=litedu.in', 'pending', 'http://www.litedu.in/', now()
  ),
(
    228, 'https://alphagroup.edu/engineering/',
    'https://alphagroup.edu/engineering/admission.php', 'https://alphagroup.edu/engineering/career-oriented-academics.php#career',
    'https://alphagroup.edu/engineering/images/menu/E15%20-%20Final%20-%20ACE%20-%20AICTE%20Mandatory%20Disclosure.pdf', null,
    'https://alphagroup.edu/engineering/contact-us.php', 'pending', 'https://alphagroup.edu/engineering/', now()
  ),
(
    229, 'https://www.indiraeducational.org/',
    'https://www.indiraeducational.org/?admission_procedure', null,
    null, null,
    'https://www.indiraeducational.org/?contact', 'pending', 'https://www.indiraeducational.org/', now()
  ),
(
    232, 'https://www.adhi.edu.in/',
    'https://www.adhi.edu.in/#contact', null,
    null, null,
    'https://www.adhi.edu.in/#contact', 'pending', 'https://www.adhi.edu.in/', now()
  ),
(
    234, 'https://velammalitech.edu.in/',
    'https://velammalitech.edu.in/academics-admission/', 'https://velammalitech.edu.in/wp-content/uploads/2025/12/Placed-Students-2024-25__.pdf',
    'https://velammalitech.edu.in/wp-content/uploads/2025/07/Mandatory-Disclosure-1.pdf', 'https://velammalitech.edu.in/nirf/',
    'https://velammalitech.edu.in/contact-us/', 'pending', 'https://velammalitech.edu.in/', now()
  ),
(
    235, 'https://grt.edu.in/',
    'https://grt.edu.in/#', 'https://grt.edu.in/placement/',
    'https://grt.edu.in/wp-content/uploads/2024/11/Mandatory-Disclosure.pdf', 'https://grt.edu.in/#',
    'https://grt.edu.in/contact-us/', 'pending', 'https://grt.edu.in/', now()
  ),
(
    236, 'https://tjsec.in/',
    'https://tjsec.in/ug-pg-admissions/', 'https://tjsec.in/placement/',
    'http://tjsec.in/wp-content/uploads/2021/05/mandatory-disclosure-2021-1.pdf', 'https://tjsec.in/nirf/',
    'https://tjsec.in/reach-us/', 'pending', 'https://tjsec.in/', now()
  ),
(
    238, 'https://www.msajce-edu.in/',
    'https://enrollonline.co.in/Registration/Apply/MSAJCE', 'https://www.msajce-edu.in/uploads/placement/internship/Intership%20Report%202025.pdf',
    'https://www.msajce-edu.in/mandatorydisclosure.php', 'https://www.msajce-edu.in/nirf.php',
    'https://www.msajce-edu.in/contact.php', 'pending', 'https://www.msajce-edu.in/', now()
  ),
(
    239, 'http://www.aiht.ac.in/',
    'mailto:admission@aiht.ac.in', 'http://www.aiht.ac.in/#',
    null, 'http://www.aiht.ac.in/nirf.php',
    'http://www.aiht.ac.in/#', 'pending', 'http://www.aiht.ac.in/', now()
  ),
(
    240, 'https://srmeaswari.ac.in/',
    'https://srmeaswari.ac.in/#', 'https://srmeaswari.ac.in/placement/',
    'https://srmeaswari.ac.in/wp-content/uploads/2025/04/AICTE_MD_2024_25.pdf', 'https://srmeaswari.ac.in/wp-content/uploads/2026/06/NIRF2025.pdf',
    'https://srmeaswari.ac.in/contact-us/', 'pending', 'https://srmeaswari.ac.in/', now()
  ),
(
    241, 'https://jeppiaarcollege.org/jeppiaar/',
    'https://docs.google.com/forms/d/e/1FAIpQLSd981BY5MrtezrDqIp3HAu403btkHC1InrGdpaZzBf30TraAA/viewform', 'https://jeppiaarcollege.org/jeppiaar/placements/',
    'https://jeppiaarcollege.org/jeppiaar/#', 'https://jeppiaarcollege.org/jeppiaar/wp-content/uploads/2025/07/NIRF-OVERALL-2025.pdf',
    'http://jeppiaarcollege.org/jeppiaar/contact-us/', 'pending', 'https://jeppiaarcollege.org/jeppiaar/', now()
  ),
(
    242, 'https://www.jerusalemengg.ac.in/',
    'https://jerusalemengg.ac.in/admission/', 'https://jerusalemengg.ac.in/placement/index.php',
    'https://www.jerusalemengg.ac.in/pdf/Updated%20Mandatory%20Disclosures-25-11-2025%20(4).pdf', 'https://www.jerusalemengg.ac.in/#',
    'https://www.jerusalemengg.ac.in/#', 'pending', 'https://www.jerusalemengg.ac.in/', now()
  ),
(
    243, 'https://msec.edu.in/',
    'https://msec.edu.in/admission2026/', 'https://msec.edu.in/placements.html',
    'https://msec.edu.in/madatorydisclosure.html', 'https://msec.edu.in/NIRF.html',
    'https://msec.edu.in/contact.html', 'pending', 'https://msec.edu.in/', now()
  ),
(
    244, 'https://www.mnmjec.ac.in/',
    'https://www.mnmjec.ac.in/#', 'https://www.mnmjec.ac.in/Placement.html',
    'https://www.mnmjec.ac.in/img/correction/mandatory_disclosure.pdf', null,
    null, 'pending', 'https://www.mnmjec.ac.in/', now()
  ),
(
    245, 'https://kcgcollege.ac.in/',
    'https://apply.kcgcollege.ac.in/', 'https://kcgcollege.ac.in/academics/aeronautical-aerospace/placement-industry/',
    'https://kcgcollege.ac.in/mandatory-disclosure/', 'https://kcgcollege.ac.in/nirf/',
    'https://kcgcollege.ac.in/contact-us/', 'pending', 'https://kcgcollege.ac.in/', now()
  ),
(
    249, 'https://stjosephs.ac.in/index.html',
    null, 'https://stjosephs.ac.in/placement/TOTAL%20OFFERS%201450.pdf',
    null, 'https://stjosephs.ac.in/pages/NIRF.html',
    null, 'pending', 'https://stjosephs.ac.in/index.html', now()
  ),
(
    250, 'https://www.tjit.edu.in/',
    'https://www.tjit.edu.in/meritscholarship.html', null,
    null, null,
    null, 'pending', 'https://www.tjit.edu.in/', now()
  ),
(
    251, 'https://www.thangavelu.edu.in/',
    'https://www.thangavelu.edu.in/#', 'https://www.thangavelu.edu.in/events.html#gallery29-1',
    null, null,
    null, 'pending', 'https://www.thangavelu.edu.in/', now()
  ),
(
    252, 'https://www.cipet.gov.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.cipet.gov.in/', now()
  ),
(
    253, 'https://www.dscet.ac.in/',
    'https://www.dscet.ac.in/#', 'https://www.dscet.ac.in/#',
    'https://dscet.ac.in/assets/pdf/mandatorydisclosure.pdf', 'https://dscet.ac.in/nirf',
    'https://www.dscet.ac.in/#', 'pending', 'https://www.dscet.ac.in/', now()
  ),
(
    254, 'https://sairamit.edu.in/',
    'https://sairamit.edu.in/#', 'https://sairamit.edu.in/training-placement/',
    'https://sairamit.edu.in/wp-content/uploads/2024/04/Final_Mandatory-Discl_250222.pdf', 'https://sairamit.edu.in/nirf/',
    'https://sairamit.edu.in/#', 'pending', 'https://sairamit.edu.in/', now()
  ),
(
    255, 'https://www.stjoseph.ac.in/',
    'https://admissions.dmifoundations.org/st-joseph-college-of-engineering-application-form', 'https://www.stjoseph.ac.in/placement1.php',
    'https://www.stjoseph.ac.in/assets/pdf/MDFinal.pdf', 'https://www.stjoseph.ac.in/reganition1.php',
    'https://www.stjoseph.ac.in/contactus.php', 'pending', 'https://www.stjoseph.ac.in/', now()
  ),
(
    260, 'https://www.citchennai.edu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.citchennai.edu.in/', now()
  ),
(
    262, 'https://apec.edu.in/',
    'https://apec.edu.in/admission/courses', 'https://apec.edu.in/clubs-association-centres/placement-cell',
    null, 'https://apec.edu.in/pages/nirf',
    'https://apec.edu.in/contact-us', 'pending', 'https://apec.edu.in/', now()
  ),
(
    264, 'https://dce.edu.in/',
    'https://dce.edu.in/admissions/', 'https://dce.edu.in/admissions-dce/#placementrecords',
    'https://dce.edu.in/mandatory-disclosures/', 'https://dce.edu.in/nirf/',
    'https://dce.edu.in/contact/', 'pending', 'https://dce.edu.in/', now()
  ),
(
    265, 'https://www.gkmcet.net.in/',
    'https://www.gkmcet.net.in/courses.php', 'https://www.gkmcet.net.in/placement.php',
    null, 'https://www.gkmcet.net.in/pdf/NIRF-2025.pdf',
    'https://www.gkmcet.net.in/contact.php', 'pending', 'https://www.gkmcet.net.in/', now()
  ),
(
    266, 'https://ifet.ac.in/',
    'https://ifet.ac.in/admissions', 'https://ifet.ac.in/placements',
    'https://ifet.ac.in/wp-content/uploads/2024/08/Mandatory-disclosure-2026-1.pdf', 'https://ifet.ac.in/nirf',
    'https://ifet.ac.in/contact', 'pending', 'https://ifet.ac.in/', now()
  ),
(
    268, 'https://www.madhaengineeringcollege.com/',
    'https://www.madhaengineeringcollege.com/form', 'https://www.madhaengineeringcollege.com/#',
    'https://www.madhaengineeringcollege.com/wp-content/uploads/2022/06/MEC_MANDATORY_DISCLOSURE_11-April_2022_New.pdf', null,
    'https://www.madhaengineeringcollege.com/contact-us/', 'pending', 'https://www.madhaengineeringcollege.com/', now()
  ),
(
    269, 'https://mailamengg.ac.in/',
    'https://mailamengg.ac.in/engineering-admission/', 'https://mailamengg.ac.in/placements/',
    'https://mailamengg.ac.in/wp-content/uploads/2026/06/MANDATORY-DISCLOSURE.pdf', 'https://mailamengg.ac.in/nirfmec/',
    'https://mailamengg.ac.in/contact-us/', 'pending', 'https://mailamengg.ac.in/', now()
  ),
(
    270, 'https://www.svct.edu.in/',
    'https://apply.svct.edu.in/', 'https://www.svct.edu.in/placements',
    null, null,
    null, 'pending', 'https://www.svct.edu.in/', now()
  ),
(
    271, 'https://psvpec.in/',
    'https://admission.psvpec.in/?utm_source=google&#038;utm_medium=online&#038;utm_campaign=website', 'https://psvpec.in/placements-details/',
    'https://psvpec.in/wp-content/uploads/2026/06/Mandatory-disclosure.pdf', 'https://psvpec.in/wp-content/uploads/2026/04/NIRF.pdf',
    'https://psvpec.in/contact/', 'pending', 'https://psvpec.in/', now()
  ),
(
    272, 'https://tsmjain.in/',
    null, null,
    null, null,
    null, 'pending', 'https://tsmjain.in/', now()
  ),
(
    273, 'https://www.sakthiec.edu.in/',
    'https://www.sakthiec.edu.in/Admission-Procedure.php', 'https://www.sakthiec.edu.in/#',
    null, null,
    'https://www.sakthiec.edu.in/Contact_Us.php', 'pending', 'https://www.sakthiec.edu.in/', now()
  ),
(
    274, 'https://sairam.edu.in/',
    'https://sairam.edu.in/#', 'https://sairam.edu.in/training-and-placement/',
    'https://sairam.edu.in/wp-content/uploads/2026/02/SSEC-MD-Feb-2026.docx.pdf', 'https://sairam.edu.in/nirf/',
    'https://sairam.edu.in/contact-info/', 'pending', 'https://sairam.edu.in/', now()
  ),
(
    275, 'https://www.tagore-engg.ac.in/',
    'https://www.tagore-engg.ac.in/#', 'https://www.tagore-engg.ac.in/#',
    'https://tagore-engg.ac.in/mandatory_disclosure.php', 'https://www.tagore-engg.ac.in/national-institutional-ranking-framework-nirf',
    'https://tagore-engg.ac.in/images/yashas24.jpeg', 'pending', 'https://www.tagore-engg.ac.in/', now()
  ),
(
    276, 'http://vrscet.in/',
    'http://vrscet.in/#', 'http://vrscet.in/#',
    'http://vrscet.in/wp-content/uploads/2026/03/FINAL-MANDATORY-DISCLOSURE-2026-2-2.pdf', 'http://vrscet.in/#',
    'http://vrscet.in/#', 'pending', 'http://vrscet.in/', now()
  ),
(
    277, 'https://srmvalliammai.ac.in/',
    'https://srmvalliammai.ac.in/admissions/', 'https://srmvalliammai.ac.in/placement',
    'https://srmvalliammai.ac.in/wp-content/uploads/2025/10/mandatory_disclosure_2025_26.pdf', 'https://srmvalliammai.ac.in/nirf/',
    'https://srmvalliammai.ac.in/contact-us', 'pending', 'https://srmvalliammai.ac.in/', now()
  ),
(
    278, 'https://www.amcet.co.in/',
    'https://www.amcet.co.in/admission-enquiry/', 'https://www.amcet.co.in/#',
    'https://www.amcet.co.in/wp-content/uploads/2026/02/Mandatory-disclosure-FINAL.pdf', null,
    'https://www.amcet.co.in/contact-us/', 'pending', 'https://www.amcet.co.in/', now()
  ),
(
    280, 'https://www.sriramanujar.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.sriramanujar.ac.in/', now()
  ),
(
    281, 'https://www.skec.edu.in/',
    'https://www.skec.edu.in/Enquiry', 'https://www.skec.edu.in/#',
    'https://www.skec.edu.in/assets/doc/Mandatory%20Disclosure.pdf', null,
    'https://www.skec.edu.in/Contact', 'pending', 'https://www.skec.edu.in/', now()
  ),
(
    282, 'https://escet.in/',
    'https://escet.in/#/', null,
    'https://escet.in/mandatory-disclosure', null,
    'https://escet.in/contact-us', 'pending', 'https://escet.in/', now()
  ),
(
    283, 'https://www.mbec.ac.in/',
    'https://forms.gle/ykqX1w3aGH6zUPBh7', null,
    null, null,
    null, 'pending', 'https://www.mbec.ac.in/', now()
  ),
(
    284, 'https://npsbcet.edu.in/',
    'https://npsbcet.edu.in/master-of-computer-application-mca/', 'https://npsbcet.edu.in/placement-cell/',
    'https://npsbcet.edu.in/wp-content/uploads/2026/06/Mandatory-Disclosure-2025-to-2026.pdf', 'https://npsbcet.edu.in/nirf/',
    'https://npsbcet.edu.in/contact/', 'pending', 'https://npsbcet.edu.in/', now()
  ),
(
    285, 'https://www.ritchennai.org/',
    'https://www.ritchennai.org/International-admission.php', 'https://www.ritchennai.org/#',
    'https://ritchennai.org/index.php', 'https://ritchennai.org/nirf.php',
    'https://ritchennai.org/contact-us.php', 'pending', 'https://www.ritchennai.org/', now()
  ),
(
    286, 'https://suryagroup.edu.in/',
    'https://suryagroup.edu.in/#', 'https://suryagroup.edu.in/#',
    'https://suryagroup.edu.in/mandatory-disclosure/', null,
    'https://suryagroup.edu.in/contact-us/', 'pending', 'https://suryagroup.edu.in/', now()
  ),
(
    287, 'http://www.arenggc.com/',
    'http://www.arenggc.com/#', 'http://www.arenggc.com/Placement-Cell.php',
    'http://www.arenggc.com/img/Mandatory-disclosure-2026-2027.pdf', null,
    'http://www.arenggc.com/Contact.php', 'pending', 'http://www.arenggc.com/', now()
  ),
(
    288, 'https://rrase.com/',
    'https://rrase.com/admission-open/', 'https://rrase.com/#',
    'https://rrase.com/mandatory-disclosure/', 'https://rrase.com/wp-content/uploads/2025/02/RRASE-College-of-Engineering20241230-.pdf',
    'https://rrase.com/contact-us/', 'pending', 'https://rrase.com/', now()
  ),
(
    289, 'https://www.skcevellore.ac.in/',
    'https://www.skcevellore.ac.in/#', 'https://www.skcevellore.ac.in/Placement%20detail%202025-2026.pdf',
    'https://www.skcevellore.ac.in/SKCE_Mandatory_Disclosure-2022.pdf', null,
    'https://www.skcevellore.ac.in/contact.html', 'pending', 'https://www.skcevellore.ac.in/', now()
  ),
(
    290, 'https://www.aktmcet.in/',
    'https://www.aktmcet.in/admission.html', 'https://www.aktmcet.in/placements.html',
    'https://www.aktmcet.in/assets/img/4201%20AKTMCET%20MANDATORY%20DISCLOSURE.pdf', 'https://www.aktmcet.in/assets/img/NIRF%202024.pdf',
    'https://www.aktmcet.in/contact.html', 'pending', 'https://www.aktmcet.in/', now()
  ),
(
    291, 'https://www.princedrkvasudevan.com/',
    'https://www.princedrkvasudevan.com/admissions/B.Tech.%20Admissions.html', 'https://www.princedrkvasudevan.com/placements/placement.html',
    'https://www.princedrkvasudevan.com/AICTE/Mandatory%20Disclosure.pdf', 'https://www.princedrkvasudevan.com/AICTE/NIRF.pdf',
    null, 'pending', 'https://www.princedrkvasudevan.com/', now()
  ),
(
    293, 'http://rangapoopathi.in/',
    null, null,
    null, null,
    null, 'pending', 'http://rangapoopathi.in/', now()
  ),
(
    296, 'https://www.peri.education/',
    'https://www.peri.education/periit/admissions.php', 'https://www.peri.education/#',
    null, null,
    'https://www.peri.education/periit/contact.php', 'pending', 'https://www.peri.education/', now()
  ),
(
    297, 'https://www.apce.in/',
    'mailto:admission@apce.in', 'https://www.apce.in/placement-training.php',
    'https://www.apce.in/doc/APCE-AICTE-MandatoryDisclosure.pdf', 'https://www.apce.in/nirf.php',
    'https://www.apce.in/contactus.php', 'pending', 'https://www.apce.in/', now()
  ),
(
    298, 'https://www.amace.edu.in/',
    'https://www.amace.edu.in/#', 'https://www.amace.edu.in/engineering-placement.php',
    'https://www.amace.edu.in/mandatory-disclosure.php', 'https://www.amace.edu.in/uploads/nirf/nirf_amace_engineering.pdf',
    'https://www.amace.edu.in/contact-us.php', 'pending', 'https://www.amace.edu.in/', now()
  ),
(
    299, 'https://www.arunai.org/',
    null, null,
    null, null,
    null, 'pending', 'https://www.arunai.org/', now()
  ),
(
    301, 'http://www.gtec.ac.in/',
    'http://www.gtec.ac.in/admission.php', 'http://www.gtec.ac.in/#',
    'http://www.gtec.ac.in/Gtec_Mandatory_Disclosure_2025_update.pdf', null,
    'http://www.gtec.ac.in/contact.php', 'pending', 'http://www.gtec.ac.in/', now()
  ),
(
    302, 'https://mce.edu.in/',
    'https://mce.edu.in/#', 'https://mce.edu.in/placements.php',
    'https://mce.edu.in/aicte.php', 'https://mce.edu.in/national-institutional-ranking-framework.php',
    'https://mce.edu.in/contact.php', 'pending', 'https://mce.edu.in/', now()
  ),
(
    303, 'http://www.priyadarshini.net.in/pec_new/',
    'http://www.priyadarshini.net.in/pec_new/examapp.apk', 'http://www.priyadarshini.net.in/pec_new/#',
    'http://www.priyadarshini.net.in/pec_new/mandis/index.php', 'http://www.priyadarshini.net.in/pec_new/nirf.php',
    'http://www.priyadarshini.net.in/pec_new/contactus.php', 'pending', 'http://www.priyadarshini.net.in/pec_new/', now()
  ),
(
    305, 'https://skpec.edu.in/',
    'https://skpec.edu.in/admission-enquiry-form-2025-2026/', 'https://skpec.edu.in/trainnings-and-placements/',
    'https://skpec.edu.in/mandatory-disclosure-accreditation/', null,
    'https://skpec.edu.in//me/contact-us-2.html', 'pending', 'https://skpec.edu.in/', now()
  ),
(
    307, 'https://nandhanam.edu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://nandhanam.edu.in/', now()
  ),
(
    309, 'https://thirumalaiengg.org/',
    'https://thirumalaiengg.org/admission/', 'https://thirumalaiengg.org/activities/#Placement-and-Training',
    'https://thirumalaiengg.org/wp-content/uploads/2026/03/MANDATORY-DISCLOSURE.pdf', null,
    'https://thirumalaiengg.org/contact-us/', 'pending', 'https://thirumalaiengg.org/', now()
  ),
(
    310, 'http://www.tcet.co.in/',
    null, null,
    null, null,
    null, 'pending', 'http://www.tcet.co.in/', now()
  ),
(
    311, 'https://www.bec.ac.in/',
    'https://www.bec.ac.in/#', 'https://www.bec.ac.in/#',
    'https://www.bec.ac.in/pdf/Mandatory-disclosure-Bharathidasan%20Engineering%20College%202.pdf', null,
    'https://www.bec.ac.in/contact.html', 'pending', 'https://www.bec.ac.in/', now()
  ),
(
    312, 'https://kingston.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://kingston.ac.in/', now()
  ),
(
    313, 'https://www.getedu.in/',
    'https://forms.gle/XoP9uVQChhS8ChFM8', 'https://www.getedu.in/#',
    null, 'https://getedu.in/nirf/',
    'https://getedu.in/contact/', 'pending', 'https://www.getedu.in/', now()
  ),
(
    314, 'https://www.annamalaiarengg.com/',
    'http://www.annamalaiarengg.com/admission-2024/', 'https://www.annamalaiarengg.com/placements/',
    'http://www.annamalaiarengg.com/mandatory-disclosure/', null,
    null, 'pending', 'https://www.annamalaiarengg.com/', now()
  ),
(
    315, 'https://www.podhigaitech.ac.in/',
    'https://www.podhigaitech.ac.in/contact-us', 'https://www.podhigaitech.ac.in/placements',
    'https://www.podhigaitech.ac.in/assets/mandatory-disclosure/mandatory-disclosure.pdf', null,
    'https://www.podhigaitech.ac.in/contact-us', 'pending', 'https://www.podhigaitech.ac.in/', now()
  ),
(
    316, 'https://www.srikrishnacollege.co.in/',
    'https://www.srikrishnacollege.co.in/#', null,
    'https://www.srikrishnacollege.co.in/#', null,
    'https://www.srikrishnacollege.co.in/contactus.php', 'pending', 'https://www.srikrishnacollege.co.in/', now()
  ),
(
    318, 'https://papniarch.ac.in/',
    'https://papniarch.ac.in/comprehensive-guide-to-b-arch-bachelor-of-architecture-course-overview-eligibility-admission-career-prospects-more/', null,
    null, null,
    'https://papniarch.ac.in/contact-us/', 'pending', 'https://papniarch.ac.in/', now()
  ),
(
    320, 'https://iecw.edu.in/',
    'https://iecw-online-admission.vercel.app/', 'https://iecw.edu.in/training-and-placements',
    'https://iecw.edu.in/public-self-disclosure', 'https://iecw.edu.in/documents/pdffiles/IECW-NIRF-2026.pdf',
    'https://iecw.edu.in/admission/contact-us', 'pending', 'https://iecw.edu.in/', now()
  ),
(
    2, 'https://www.annauniv.edu/act/',
    'https://www.annauniv.edu/act/admission/index.html', 'https://www.annauniv.edu/act/Training%20and%20Placement/index.html',
    null, null,
    'https://www.annauniv.edu/act/contact/index.html', 'pending', 'https://www.annauniv.edu/act/', now()
  ),
(
    323, 'http://cit.edu.in/',
    'https://cit.edu.in/computer-applications-mca', 'javascript:void(0);',
    'https://cit.edu.in/others/ugc-public-self-disclosure', 'https://cit.edu.in/others/nirf',
    'https://cit.edu.in/contact-us', 'pending', 'http://cit.edu.in/', now()
  ),
(
    324, 'https://www.aurcc.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.aurcc.ac.in/', now()
  ),
(
    325, 'https://shanmugha.edu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://shanmugha.edu.in/', now()
  ),
(
    327, 'https://nsn.ac.in/',
    'https://nsn.ac.in/#', 'https://nsn.ac.in/placement/',
    'https://nsn.ac.in/aicte/mandatory-disclosure', 'https://nsn.ac.in/iqac/nirf',
    'https://nsn.ac.in/location/', 'pending', 'https://nsn.ac.in/', now()
  ),
(
    328, 'https://www.ksriet.ac.in/',
    'https://ksrce.ac.in/', 'https://www.ksriet.ac.in/page/training-and-placement-team.html',
    'https://ksriet.ac.in/admin/file_manager/source/Mandatory/AICTE_MANDATORY_DISCLOSURE_2021-2022.pdf', 'https://www.ksriet.ac.in/page/nirf.html',
    'https://www.ksriet.ac.in/page/contact.html', 'pending', 'https://www.ksriet.ac.in/', now()
  ),
(
    329, 'https://rtc.ac.in/',
    'https://rtc.ac.in/#', 'https://rtc.ac.in/about-placement-cell/',
    'https://rtc.ac.in/mandatory-disclosures/', 'https://rtc.ac.in/nirf/',
    'https://rtc.ac.in/exam-contact/', 'pending', 'https://rtc.ac.in/', now()
  ),
(
    331, 'https://www.acetcbe.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.acetcbe.in/', now()
  ),
(
    332, 'http://ganeshenggcollege.org/',
    'http://ganeshenggcollege.org/admission-enquiry.php', 'http://ganeshenggcollege.org/placement-record.php',
    'https://ganeshenggcollege.org/e-irc.php', null,
    'http://ganeshenggcollege.org/#', 'pending', 'http://ganeshenggcollege.org/', now()
  ),
(
    333, 'https://www.sriet.ac.in/',
    'https://sriet.ac.in/admission-enquiry-form/', 'https://sriet.ac.in/placement/',
    'https://sriet.ac.in/mandatory-disclosure/', 'https://sriet.ac.in/nirf/',
    'https://sriet.ac.in/contact-us/', 'pending', 'https://www.sriet.ac.in/', now()
  ),
(
    334, 'https://www.iihtsalem.edu.in/',
    'https://www.iihtsalem.edu.in/admissions/', 'https://www.iihtsalem.edu.in/placement-office/',
    'https://www.iihtsalem.edu.in/wp-content/uploads/2026/06/AICTE-mandatory-Disclosure.pdf', null,
    'https://www.iihtsalem.edu.in/contact/', 'pending', 'https://www.iihtsalem.edu.in/', now()
  ),
(
    335, 'https://www.ksakongu.edu.in/',
    'https://www.ksakongu.edu.in/admin.html', null,
    null, 'https://www.ksakongu.edu.in/assets/document/nirf2025.pdf',
    'https://www.ksakongu.edu.in/contact.html', 'pending', 'https://www.ksakongu.edu.in/', now()
  ),
(
    336, 'https://www.dgct.ac.in/',
    'https://www.dgct.ac.in/#', 'https://www.dgct.ac.in/placement.php',
    'https://dgct.ac.in/mandatory/', 'https://www.dgct.ac.in/nirf2026.pdf',
    'https://www.dgct.ac.in/contact.php', 'pending', 'https://www.dgct.ac.in/', now()
  ),
(
    337, 'https://shreesathyam.edu.in/',
    'https://shreesathyam.edu.in/admission/#apply', 'https://shreesathyam.edu.in/placement-about-placement/',
    'https://shreesathyam.edu.in/wp-content/uploads/2026/05/SSCET_Mandatory-Disclosures.pdf', null,
    'https://shreesathyam.edu.in/contact-us/', 'pending', 'https://shreesathyam.edu.in/', now()
  ),
(
    339, 'https://www.sanarch.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.sanarch.in/', now()
  ),
(
    340, 'https://www.dhaanishitech.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.dhaanishitech.ac.in/', now()
  ),
(
    341, 'https://www.jairupa.org/',
    null, null,
    'https://www.jairupa.org/Mandatory%20Disclosure.pdf', null,
    'https://www.jairupa.org/#contact', 'pending', 'https://www.jairupa.org/', now()
  ),
(
    342, 'https://www.pietech.edu.in/',
    'https://forms.gle/SbP8aP95euqRNZfr5', 'https://www.pietech.edu.in/#',
    'https://www.pietech.edu.in/doc/Mandatory%20Disclosure/Mandatory%20Disclosure%202026.pdf', 'https://www.pietech.edu.in/NIRF.php',
    'https://www.pietech.edu.in/contact.php', 'pending', 'https://www.pietech.edu.in/', now()
  ),
(
    343, 'https://arulmurugan.edu.in/',
    'https://arulmurugan.edu.in/#', 'https://arulmurugan.edu.in/#',
    'https://shorturl.at/DPR7S', null,
    'https://arulmurugan.edu.in/contact/', 'pending', 'https://arulmurugan.edu.in/', now()
  ),
(
    344, 'https://vsbcetc.edu.in/',
    'https://vsbcetc.edu.in/admission/', 'https://vsbcetc.edu.in/#',
    'https://vsbcetc.edu.in/mandatory-disclosure/', 'https://vsbcetc.edu.in/nirf-4/',
    'https://vsbcetc.edu.in/#', 'pending', 'https://vsbcetc.edu.in/', now()
  ),
(
    345, 'https://www.sugunace.com/',
    'https://www.sugunace.com/#!', null,
    'https://www.sugunace.com/MANDATORY%20Disclosure.html', null,
    'https://www.sugunace.com/contact.html', 'pending', 'https://www.sugunace.com/', now()
  ),
(
    346, 'https://scsa.ac.in/',
    'mailto:admissions@scsa.ac.in', 'https://scsa.ac.in/placement/',
    'https://scsa.ac.in/wp-content/uploads/2026/03/MANDATORY-DISCLOSURE.pdf', null,
    'https://scsa.ac.in/contact-us/', 'pending', 'https://scsa.ac.in/', now()
  ),
(
    347, 'https://www.soaciet.edu.in/',
    'https://docs.google.com/forms/d/1_123fuPwcTk1_ylMVd5-BocOFANAhfynKbn9Sd5_bq4/edit', 'https://www.soaciet.edu.in/recruiters',
    null, 'https://www.soaciet.edu.in/nirf',
    'https://www.soaciet.edu.in/contact', 'pending', 'https://www.soaciet.edu.in/', now()
  ),
(
    349, 'https://www.actechnology.in/',
    'https://www.actechnology.in/admission/#applynow', 'https://www.actechnology.in/#',
    'https://www.actechnology.in/wp-content/uploads/2025/07/Man-dis-2025.pdf', 'https://www.actechnology.in/wp-content/uploads/2025/02/ARJUN-COLLEGE-OF-TECHNOLOGY20250117-1.pdf',
    'https://www.actechnology.in/contact-us/', 'pending', 'https://www.actechnology.in/', now()
  ),
(
    353, 'https://www.hsoa.ac.in/',
    'https://www.hsoa.ac.in/admission', null,
    'https://www.hsoa.ac.in/Mandatory%20Disclosure%207243%20-%20Hindusthan%20School%20of%20Architecture.pdf', 'https://www.hsoa.ac.in/Hindusthan%20School%20of%20Architecture20240130-%20NIRF.pdf',
    'https://www.hsoa.ac.in/contact', 'pending', 'https://www.hsoa.ac.in/', now()
  ),
(
    355, 'https://psgitech.ac.in/',
    'http://psgitech.ac.in/admission-details', 'http://psgitech.ac.in/placements',
    'http://psgitech.ac.in/assets/pdf/Mandatory_Disclosure_2025_26.pdf', 'https://psgitech.ac.in/uploads/pdf/NIRF/NIRF_2026_PSGiTech.pdf',
    'http://psgitech.ac.in/contact', 'pending', 'https://psgitech.ac.in/', now()
  ),
(
    356, 'https://adhiyamaan.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://adhiyamaan.ac.in/', now()
  ),
(
    357, 'https://www.amsheela.org.in/',
    'https://www.amsheela.org.in/mca.aspx', 'https://www.amsheela.org.in/placement_home.aspx',
    'https://www.amsheela.org.in/pdf/Mandatory%20Disclosure%2025-26.pdf', null,
    'https://www.amsheela.org.in/phoneno.aspx', 'pending', 'https://www.amsheela.org.in/', now()
  ),
(
    359, 'http://www.jcet.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'http://www.jcet.ac.in/', now()
  ),
(
    360, 'https://ksrct.ac.in/',
    'https://ksrct.ac.in/admission.php', 'https://ksrct.ac.in/training-placement.php',
    'https://ksrct.ac.in/assets/pdf/quicklinks_pdfs/AICTE-MandatoryDisclosure2025_26.pdf', 'https://ksrct.ac.in/nirf.php',
    null, 'pending', 'https://ksrct.ac.in/', now()
  ),
(
    361, 'https://www.mkce.ac.in/',
    'https://forms.gle/EGoB193DkB9tu3ts8', 'https://www.mkce.ac.in/placement.php',
    'https://mkce.ac.in/files/MKCE__MD.pdf', 'https://mkce.ac.in/nirf.php',
    'https://www.mkce.ac.in/contact-us', 'pending', 'https://www.mkce.ac.in/', now()
  ),
(
    362, 'https://mahendra.info/',
    'https://mahendra.org/admission/', 'https://mahendra.info/blog/',
    'https://mahendra.info/wp-content/uploads/2026/06/Mandatory-Disclosure_2025-26.pdf', 'https://mahendra.info/nirf/',
    'https://mahendra.info/#', 'pending', 'https://mahendra.info/', now()
  ),
(
    363, 'https://mec.edu.in/',
    'https://mec.edu.in/admission/', 'https://mec.edu.in/placement/about-placement/',
    'https://mec.edu.in/storage/2026/01/Mandatory-Disclosure2025-26.pdf', 'https://mec.edu.in/mec/nirf/',
    'https://mec.edu.in/mec/contact-us/', 'pending', 'https://mec.edu.in/', now()
  ),
(
    364, 'https://pec.paavai.edu.in/',
    'https://pec.paavai.edu.in/master-of-computer-application/', 'https://pec.paavai.edu.in/placements/',
    'https://pec.paavai.edu.in/wp-content/uploads/2026/03/MD-2025-26.pdf', 'https://pec.paavai.edu.in/wp-content/uploads/2026/04/Paavai-Engineering-College.pdf',
    'https://pec.paavai.edu.in/contact-us/', 'pending', 'https://pec.paavai.edu.in/', now()
  ),
(
    366, 'https://www.ksrce.ac.in/',
    'https://ksrce.ac.in/index.php/page?id=494&item=892', 'https://www.ksrce.ac.in/index.php/page?id=1032&item=154',
    'https://www.ksrce.ac.in/index.php/page?id=1086&item=395', 'https://ksrce.ac.in/index.php/page?id=1022&item=368',
    'https://www.ksrce.ac.in/index.php/page?id=494&item=892', 'pending', 'https://www.ksrce.ac.in/', now()
  ),
(
    367, 'https://www.ssmce.ac.in/',
    'https://www.ssmce.ac.in/placement.php', 'https://www.ssmce.ac.in/placement.php',
    'https://www.ssmce.ac.in/mandatorydisclosure.php', 'https://www.ssmce.ac.in/#',
    'https://www.ssmce.ac.in/contactus.php', 'pending', 'https://www.ssmce.ac.in/', now()
  ),
(
    370, 'https://sect.edu.in/',
    'https://sect.edu.in/#', 'https://sect.edu.in/#',
    null, 'https://sect.edu.in/NIRF.html',
    'https://sect.edu.in/contact-us.html', 'pending', 'https://sect.edu.in/', now()
  ),
(
    372, 'https://www.vcenggw.ac.in/',
    'https://www.vcenggw.ac.in/admission.php', 'https://www.vcenggw.ac.in/placement.php',
    'https://www.vcenggw.ac.in/mandatory.php', 'https://www.vcenggw.ac.in/nirf.php',
    'https://www.vcenggw.ac.in/contact.php', 'pending', 'https://www.vcenggw.ac.in/', now()
  ),
(
    374, 'https://vsbec.edu.in/',
    'https://admissions.vsbcetc.edu.in/application-form-vsb-karur-campus?utm_source=organic&#038;utm_medium=google&#038;utm_campaign=karur', 'https://vsbec.edu.in/placement-details/',
    'https://vsbec.edu.in/mandatory-disclosure/', 'https://vsbec.edu.in/#',
    'https://vsbec.edu.in/contact-us/', 'pending', 'https://vsbec.edu.in/', now()
  ),
(
    376, 'https://www.gct.org.in/',
    'https://www.gct.org.in/admission.html', 'https://www.gct.org.in/placement.html',
    'https://www.gct.org.in/docs/MANDATORYFORM.pdf', 'https://www.gct.org.in/#',
    'https://www.gct.org.in/admission.html?show=contact', 'pending', 'https://www.gct.org.in/', now()
  ),
(
    377, 'https://www.kavery.org.in/',
    'https://forms.gle/537Sv3fGE49gFLMDA', 'https://www.kavery.org.in/#',
    null, null,
    'https://www.kavery.org.in/contact.aspx', 'pending', 'https://www.kavery.org.in/', now()
  ),
(
    378, 'https://selvamtech.edu.in/',
    'https://selvamtech.edu.in/about/admission/', 'https://selvamtech.edu.in/placement/placement/',
    'https://selvamtech.edu.in/files/Mandatory-Disclosure.pdf', 'https://selvamtech.edu.in/nirf/',
    'https://selvamtech.edu.in/#', 'pending', 'https://selvamtech.edu.in/', now()
  ),
(
    379, 'https://pce.paavai.edu.in/',
    'https://pce.paavai.edu.in/master-of-computer-applications/hod/', 'https://pce.paavai.edu.in/#',
    'https://pce.paavai.edu.in/wp-content/uploads/2026/01/AICTE-2025-26-MoD-Final-22.01.2026.pdf', null,
    'https://pce.paavai.edu.in/contact-us/', 'pending', 'https://pce.paavai.edu.in/', now()
  ),
(
    380, 'https://www.chettinadtech.ac.in/',
    'https://www.chettinadtech.ac.in/intranet/AdmissionCap', 'https://www.chettinadtech.ac.in/#placement-form',
    'https://www.chettinadtech.ac.in/intranet/Vmore1', 'https://www.chettinadtech.ac.in/intranet/NIRF',
    'https://www.chettinadtech.ac.in/intranet/Contact', 'pending', 'https://www.chettinadtech.ac.in/', now()
  ),
(
    382, 'https://vvcet.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://vvcet.ac.in/', now()
  ),
(
    383, 'https://excelinstitutions.com/',
    'https://excelinstitutions.com/#', 'https://excelinstitutions.com/placement/',
    null, null,
    'https://excelinstitutions.com/contact-us/', 'pending', 'https://excelinstitutions.com/', now()
  ),
(
    385, 'https://www.avsenggcollege.ac.in/',
    'https://www.avsenggcollege.ac.in/#', 'https://www.avsenggcollege.ac.in/#',
    'https://www.avsenggcollege.ac.in/Disclosure.php', 'https://www.avsenggcollege.ac.in/NIRF.php',
    'https://www.avsenggcollege.ac.in/contact.php', 'pending', 'https://www.avsenggcollege.ac.in/', now()
  ),
(
    386, 'https://mecw.org/',
    'https://mecw.org/#', 'https://mecw.org/#',
    'https://mecw.org/wp-content/uploads/2025/07/Mandatory-disclosure_2025.pdf', null,
    'https://mecw.org/contact/', 'pending', 'https://mecw.org/', now()
  ),
(
    388, 'https://www.jit.net.in/',
    'https://www.jit.net.in/#', 'https://www.jit.net.in/Placement.php',
    'https://www.jit.net.in/#', null,
    'https://www.jit.net.in/contact_us.php', 'pending', 'https://www.jit.net.in/', now()
  ),
(
    389, 'https://livesydneypools.org/',
    null, null,
    null, null,
    null, 'pending', 'https://livesydneypools.org/', now()
  ),
(
    390, 'https://psvcet.ac.in/',
    'https://psvcet.ac.in/#', 'https://psvcet.ac.in/#',
    'https://psvcet.ac.in/psv-doc/mandatory_disclosure_2025-26.pdf', 'https://psvcet.ac.in/nirf/',
    'https://psvcet.ac.in/contact-us/', 'pending', 'https://psvcet.ac.in/', now()
  ),
(
    391, 'https://biew.ac.in/',
    'https://biew.ac.in/ad-po/', 'https://biew.ac.in/about/',
    'https://biew.ac.in/wp-content/uploads/2026/05/Mandatory-Disclosure.pdf', 'https://biew.ac.in/wp-content/uploads/2023/02/BHARATHIYAR-INSTITUTE-OF-ENGINEERING-FOR-WOMEN20230120-OVERALL.pdf',
    'https://biew.ac.in/contact-us/', 'pending', 'https://biew.ac.in/', now()
  ),
(
    392, 'https://www.tagoreiet.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.tagoreiet.ac.in/', now()
  ),
(
    393, 'https://engg.jkkn.ac.in/',
    'https://engg.jkkn.ac.in/admissions', 'https://placements.jkkn.ac.in/',
    'https://engg.jkkn.ac.in/mandatory-disclosure', 'https://engg.jkkn.ac.in/iqac/nirf/nirf-2024',
    'https://engg.jkkn.ac.in/contact', 'pending', 'https://engg.jkkn.ac.in/', now()
  ),
(
    394, 'https://www.aecsalem.edu.in/',
    'https://www.aecsalem.edu.in/#admissions', 'https://www.aecsalem.edu.in/placement.php',
    'https://www.aecsalem.edu.in/mandatory-disclosure.php', 'https://www.aecsalem.edu.in/nirf.php',
    'https://www.aecsalem.edu.in/contact-us.php', 'pending', 'https://www.aecsalem.edu.in/', now()
  ),
(
    395, 'https://www.ckec.ac.in/',
    'https://admissions.dmifoundations.org/christ-the-king-engineering-college', 'https://www.ckec.ac.in/#',
    'https://www.ckec.ac.in/15.Mandatorydisclosures%20-%20Jan%2024%202026.pdf', 'https://ckec.ac.in/ANNAUNIVERSITY/nirf/nirf2026.pdf',
    'mailto:contact@ckec.ac.in', 'pending', 'https://www.ckec.ac.in/', now()
  ),
(
    396, 'https://www.jayshriram.edu.in/',
    'https://www.jayshriram.edu.in/admission.html', 'https://www.jayshriram.edu.in/#',
    'https://www.jayshriram.edu.in/pdf2/Mandatory-Disclosure-Jai-Shriram-Engineering-College-Tirpur.pdf', 'https://www.jayshriram.edu.in/pdf/NIRF-Overall_merged.pdf',
    'https://www.jayshriram.edu.in/contact-us.html', 'pending', 'https://www.jayshriram.edu.in/', now()
  ),
(
    397, 'https://alameen.ac.in/',
    'https://alameen.ac.in/application-form/', 'https://alameen.ac.in/placement/',
    'https://alameen.ac.in/wp-content/uploads/2024/04/AICTE_Mandatory-Disclosure-AEC.pdf', 'https://alameen.ac.in/wp-content/uploads/2026/04/AL-Ameen-Engineering-College20260415-1-3.pdf',
    'https://alameen.ac.in/location/', 'pending', 'https://alameen.ac.in/', now()
  ),
(
    398, 'https://kiot.ac.in/',
    'tel:+919894701234', 'tel:+919894790284',
    'https://kiot.ac.in/wp-content/uploads/2025/12/AICTE-Mandatory-Disclosure-25-26.pdf', 'https://kiot.ac.in/iqac/nirf-reports/',
    'tel:+919600541414', 'pending', 'https://kiot.ac.in/', now()
  ),
(
    400, 'https://www.vsagroup.ac.in/',
    'https://forms.gle/ecY8q6rKrdFLfFCY8', 'https://www.vsagroup.ac.in/placement.html',
    'https://www.vsagroup.ac.in/usefullinks.html', null,
    'https://www.vsagroup.ac.in/contact.html#map', 'pending', 'https://www.vsagroup.ac.in/', now()
  ),
(
    402, 'http://www.vctw.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'http://www.vctw.ac.in/', now()
  ),
(
    403, 'https://www.miet.asia/',
    'https://mahendra.org/admission', 'https://www.miet.asia/Placement-record.html',
    'http://www.miet.asia/downloads/mandatory-disclosure.pdf', null,
    'https://www.miet.asia/contact.html', 'pending', 'https://www.miet.asia/', now()
  ),
(
    404, 'https://excelinstitutions.com/excel_arch/',
    'https://excelinstitutions.com/excel_arch/#', null,
    'http://excelinstitutions.com/excel_arch/wp-content/uploads/2021/08/Mandatory-Disclosure.pdf', null,
    'http://excelinstitutions.com/excel_arch/contact-us/', 'pending', 'https://excelinstitutions.com/excel_arch/', now()
  ),
(
    405, 'https://www.sreesakthi.edu.in/',
    'https://www.sreesakthi.edu.in/assets/img/pdf/admission-brochure-new-2025.pdf', 'javascript:void(0)',
    null, 'https://www.sreesakthi.edu.in/nirf',
    'https://www.sreesakthi.edu.in/contact.html', 'pending', 'https://www.sreesakthi.edu.in/', now()
  ),
(
    406, 'https://shreenivasa.info/',
    'https://shreenivasa.info/#', 'https://shreenivasa.info/#',
    'https://shreenivasa.info/pdf/Mandatory%20Disclosure_2024.pdf', null,
    'https://shreenivasa.info/LlibraryContact.aspx', 'pending', 'https://shreenivasa.info/', now()
  ),
(
    407, 'https://www.bitsathy.ac.in/',
    'https://www.bitsathy.ac.in/#', 'https://www.bitsathy.ac.in/placement/',
    'https://www.bitsathy.ac.in/wp-content/uploads/aicte-mandatory-disclosure.pdf', 'https://www.bitsathy.ac.in/nirf/',
    'https://www.bitsathy.ac.in/research-contact/', 'pending', 'https://www.bitsathy.ac.in/', now()
  ),
(
    408, 'https://www.cietcbe.edu.in/',
    'https://docs.google.com/forms/d/e/1FAIpQLSegRCwqFpSCobIFALS2jm090r2wVeef_Rsr5FHxevYAR9qnag/viewform', 'https://www.cietcbe.edu.in/placements',
    'https://www.cietcbe.edu.in/upload/Mandaory%20Disclosure.PDF', 'https://www.cietcbe.edu.in/#',
    'https://www.cietcbe.edu.in/contact', 'pending', 'https://www.cietcbe.edu.in/', now()
  ),
(
    409, 'https://csice.edu.in/',
    'https://csice.edu.in/admissions/', 'https://csice.edu.in/placements/',
    null, 'https://csice.edu.in/nirf/',
    'https://csice.edu.in/contact-us/', 'pending', 'https://csice.edu.in/', now()
  ),
(
    410, 'https://sproutlms.mcet.in/login/index.php',
    null, null,
    null, null,
    'https://sproutlms.mcet.in/user/contactsitesupport.php', 'pending', 'https://sproutlms.mcet.in/login/index.php', now()
  ),
(
    411, 'https://erode-sengunthar.ac.in/',
    'https://erode-sengunthar.ac.in/#', 'https://erode-sengunthar.ac.in/tap-vision-and-mission/',
    null, 'https://erode-sengunthar.ac.in/nirf/',
    'https://erode-sengunthar.ac.in/about-us/location/', 'pending', 'https://erode-sengunthar.ac.in/', now()
  ),
(
    412, 'https://www.hindusthan.net/',
    'javascript:void(0)', null,
    null, null,
    'https://www.hindusthan.net/contact-us.html', 'pending', 'https://www.hindusthan.net/', now()
  ),
(
    413, 'https://www.gcee.ac.in/',
    'https://www.gcee.ac.in/News/Lateral_PQ_2025-26.pdf', 'javascript:void(0);',
    'https://www.gcee.ac.in/AICTE/MandatoryDisclosure2025-26.pdf', 'https://www.gcee.ac.in/NIRF/NIRF2024.pdf',
    'https://www.gcee.ac.in/placementcontact.php', 'pending', 'https://www.gcee.ac.in/', now()
  ),
(
    414, 'https://kce.ac.in/',
    'https://admission.kce.ac.in/', 'https://kce.ac.in/#',
    'https://kce.ac.in/mandatory-disclosure/', null,
    'https://kce.ac.in/placement-contact', 'pending', 'https://kce.ac.in/', now()
  ),
(
    415, 'https://www.kongu.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.kongu.ac.in/', now()
  ),
(
    416, 'https://kct.ac.in/',
    'https://admissions.kumaraguru.edu.in/kct-ug-application-form', 'https://kct.ac.in/placement/',
    'https://kct.ac.in/wp-content/uploads/2025/09/Mandatory-Disclosure-2024-25.pdf', 'https://kct.ac.in/nirf-nba/',
    'https://kct.ac.in/contact/', 'pending', 'https://kct.ac.in/', now()
  ),
(
    417, 'https://mpnmjec.ac.in/',
    'tel:9223372036854775807', 'https://mpnmjec.ac.in/placement/',
    'https://mpnmjec.ac.in/guidelines-on-public-self-disclosure/', 'https://mpnmjec.ac.in/nirf-national-institutional-ranking-framework/',
    'https://mpnmjec.ac.in/contact-us/', 'pending', 'https://mpnmjec.ac.in/', now()
  ),
(
    418, 'https://nandhaengg.org/',
    'https://nandhaengg.org/admission/', 'https://nandhaengg.org/placement/',
    'https://nandhaengg.org/wp-content/uploads/2025/07/MANDATORY-DISCLOSURE_final_2025.pdf', 'https://nandhaengg.org/nirf/',
    'https://nandhaengg.org/contact-us/', 'pending', 'https://nandhaengg.org/', now()
  ),
(
    419, 'https://www.pcet.ac.in/',
    'https://www.pcet.ac.in/admission-enquiry-form-park-engineering-college-in-coimbatore/', 'https://www.pcet.ac.in/placement-training/',
    'http://pcet.ac.in/Application_Part1_Report_2019-20.PDF', 'https://www.pcet.ac.in/#',
    'https://www.pcet.ac.in/contact-park-college-of-engineering-and-technology-coimbatore/', 'pending', 'https://www.pcet.ac.in/', now()
  ),
(
    421, 'https://skcet.ac.in/',
    'https://skcet.ac.in/admissions/admission-procedure/', 'https://skcet.ac.in/placement/placement-team/',
    'https://skcet.ac.in/wp-content/uploads/2025/07/AICTE-Mandatory-Disclosure.pdf', 'https://skcet.ac.in/rankings/nirf/',
    null, 'pending', 'https://skcet.ac.in/', now()
  ),
(
    423, 'https://tnce.ac.in/',
    'https://tnce.ac.in/admission', 'https://tnce.ac.in/Placements',
    'https://tnce.ac.in/pdf/Mandatory-Disclosure.pdf', null,
    'https://tnce.ac.in/contact', 'pending', 'https://tnce.ac.in/', now()
  ),
(
    424, 'https://skct.edu.in/',
    'https://data.skct.edu.in/media/Hostel_Application___Hostel_Undertaking.pdf', 'https://skct.edu.in/placement/placement-cell/',
    null, 'https://skct.edu.in/rankings/nirf/',
    'https://skct.edu.in/about-us/contact-us/', 'pending', 'https://skct.edu.in/', now()
  ),
(
    425, 'https://www.velalarengg.ac.in/',
    'https://www.velalarengg.ac.in/online-admission-enquiry/', 'https://www.velalarengg.ac.in/career-development-cell/',
    'https://www.velalarengg.ac.in/mandatory-disclosure-2025-26/', 'https://www.velalarengg.ac.in/nirf/',
    null, 'pending', 'https://www.velalarengg.ac.in/', now()
  ),
(
    427, 'https://snsct.org/',
    'https://main.snsgroups.com/EnquiryNow/', 'https://iipc.snsgroups.com/',
    null, 'https://snsct.org/nirf3/',
    null, 'pending', 'https://snsct.org/', now()
  ),
(
    429, 'https://www.tnsa.ac.in/',
    'https://www.tnsa.ac.in/#', null,
    null, null,
    'https://www.tnsa.ac.in/contact.php', 'pending', 'https://www.tnsa.ac.in/', now()
  ),
(
    430, 'https://www.nehrucolleges.org/',
    'https://apply.nehrucolleges.com/', 'https://www.nehrucolleges.org/placement',
    'https://www.nehrucolleges.org/docs/committee-2025/NIET-Mandatory-Disclosure.pdf', 'https://www.nehrucolleges.org/nirf',
    'https://www.nehrucolleges.org/contact', 'pending', 'https://www.nehrucolleges.org/', now()
  ),
(
    431, 'https://rvscet.ac.in/',
    'https://rvscet.ac.in/admission/', 'https://rvscet.ac.in/#',
    'https://rvscet.ac.in/wp-content/themes/rvscet-cms/homeassets/my-img/Mandatory-Discloser.pdf', 'https://rvscet.ac.in/nirf/',
    'https://rvscet.ac.in/contact-us', 'pending', 'https://rvscet.ac.in/', now()
  ),
(
    432, 'http://www.infoengg.com/',
    'http://admission.infoengg.com/', 'http://www.infoengg.com/#',
    'http://www.infoengg.com/?action=iqac&amp;article=mandatory-disclosure', 'http://www.infoengg.com/images/NIRF2526INFO.pdf',
    'http://www.infoengg.com/contact.html', 'pending', 'http://www.infoengg.com/', now()
  ),
(
    433, 'https://angelcollege.edu.in/',
    'https://angelcollege.edu.in/admissions/', 'https://angelcollege.edu.in/placement-2/',
    'https://angelcollege.edu.in/wp-content/uploads/2016/11/9.-AICTE-Mandatory-Disclosure.pdf', 'https://angelcollege.edu.in/nirf/',
    'https://angelcollege.edu.in/contact/', 'pending', 'https://angelcollege.edu.in/', now()
  ),
(
    435, 'https://karpagamtech.ac.in/',
    'https://admission.karpagamtech.ac.in/', 'https://karpagamtech.ac.in/#',
    'https://karpagamtech.ac.in/files/Mandatory-Disclosure.pdf', 'https://karpagamtech.ac.in/kit/wp-content/uploads/2025/02/Karpagam-Institute-of-Technology20250214-.pdf',
    'https://karpagamtech.ac.in/contact-us/', 'pending', 'https://karpagamtech.ac.in/', now()
  ),
(
    436, 'https://www.drngpit.ac.in/',
    'https://admissions.drngpit.ac.in/', null,
    'https://www.drngpit.ac.in/pdf/Mandatory_disclosure_2025-26.pdf', 'https://www.drngpit.ac.in/nirf',
    'https://www.drngpit.ac.in/contact', 'pending', 'https://www.drngpit.ac.in/', now()
  ),
(
    437, 'https://www.reccbe.ac.in/',
    'https://www.reccbe.ac.in/#', 'https://www.reccbe.ac.in/#',
    'https://www.reccbe.ac.in/mandatory-disclosure.php', 'https://www.reccbe.ac.in/nirf.php',
    'https://www.reccbe.ac.in/contact-us.php', 'pending', 'https://www.reccbe.ac.in/', now()
  ),
(
    439, 'https://hit.edu.in/',
    'javascript:void(0)', 'javascript:void(0)',
    'https://hit.edu.in/reports.html#mandatory', 'https://hit.edu.in/nirf.html',
    'https://hit.edu.in/cdn-cgi/l/email-protection#54743c3d207a3b32323d3731143c3d3a302127203c353a7a3a3120', 'pending', 'https://hit.edu.in/', now()
  ),
(
    440, 'https://www.pacolleges.org/',
    'https://www.pacolleges.org/#', 'https://www.pacolleges.org/#',
    'https://www.pacolleges.org/#accordion16', 'https://www.pacolleges.org/images/accrediation/NIRF%202026.pdf',
    'https://www.pacolleges.org/location.html', 'pending', 'https://www.pacolleges.org/', now()
  ),
(
    441, 'https://dsce.ac.in/',
    'tel:9500149092', 'https://dsce.ac.in/placement/',
    'https://dsce.ac.in/mandatory-disclosure/', 'https://dsce.ac.in/nirf/',
    'https://dsce.ac.in/contact-us', 'pending', 'https://dsce.ac.in/', now()
  ),
(
    442, 'https://adithyatech.edu.in/',
    'https://adithyatech.edu.in/#', 'https://adithyatech.edu.in/placement-cell/',
    null, 'https://adithyatech.edu.in/nirf-2024/',
    'https://adithyatech.edu.in/contact', 'pending', 'https://adithyatech.edu.in/', now()
  ),
(
    444, 'https://www.svhec.com/',
    'https://www.svhec.com/admission/', 'https://www.svhec.com/placement/',
    'https://www.svhec.com/pdf/Mandatory%20Disclosure.pdf', 'https://www.svhec.com/wp-content/uploads/2026/03/NIRF.pdf',
    'https://www.svhec.com/contact-us/', 'pending', 'https://www.svhec.com/', now()
  ),
(
    445, 'https://www.surya.ac.in/',
    'https://www.surya.ac.in/admission-form.html', null,
    'https://www.surya.ac.in/assets/pdf/mandatory.pdf', null,
    'https://www.surya.ac.in/contact.html', 'pending', 'https://www.surya.ac.in/', now()
  ),
(
    446, 'https://www.easacollege.com/',
    'https://www.easacollege.com/admission-enquiry-for-engineering-colleges-in-coimbatore', 'https://www.easacollege.com/#',
    'https://www.easacollege.com/Mandatory%20Disclosure%20February%202022.pdf', 'https://www.easacollege.com/#',
    'https://www.easacollege.com/contact-easa-college-of-engineering-and-technology', 'pending', 'https://www.easacollege.com/', now()
  ),
(
    447, 'https://www.kitcbe.com/',
    'https://www.kitcbe.com/online-admission', 'https://www.kitcbe.com/placement',
    'https://www.kitcbe.com/assets/img/mandatory-disclosure.pdf', 'https://www.kitcbe.com/assets/img/NIRF.pdf',
    'https://www.kitcbe.com/contact-us', 'pending', 'https://www.kitcbe.com/', now()
  ),
(
    448, 'https://www.kgkite.ac.in/',
    'https://www.kgkite.ac.in/admission/', 'https://www.kgkite.ac.in/success-stories/',
    'https://www.kgkite.ac.in/wp-content/uploads/2026/02/Mandatory-Disclosure-2025-26-1.pdf', 'https://www.kgkite.ac.in/nirf/',
    'https://www.kgkite.ac.in/contact-us/', 'pending', 'https://www.kgkite.ac.in/', now()
  ),
(
    449, 'https://nandhatech.org/',
    'https://nandhatech.org/#', 'https://nandhatech.org/#',
    null, null,
    'https://nandhatech.org/contact-us/', 'pending', 'https://nandhatech.org/', now()
  ),
(
    450, 'https://www.ppg.edu.in/',
    'https://ppgadmissions.ppg.edu.in/l?slug=32C1CVM5p8', 'https://www.ppg.edu.in/#',
    null, null,
    'https://www.ppg.edu.in/contact.php', 'pending', 'https://www.ppg.edu.in/', now()
  ),
(
    451, 'http://nitcbe.ac.in/',
    'http://nitcbe.ac.in/#', 'http://nitcbe.ac.in/#',
    'http://nitcbe.ac.in/wp-content/uploads/2025/08/AICTE-NIT-Mandatory-Disclosure-25-26-.pdf', 'http://nitcbe.ac.in/nirf-2/',
    'http://nitcbe.ac.in/contact-us/', 'pending', 'http://nitcbe.ac.in/', now()
  ),
(
    452, 'https://www.jkkmct.edu.in/',
    'https://www.jkkmct.edu.in/admission.php', 'https://www.jkkmct.edu.in/placement-records.php',
    'https://www.jkkmct.edu.in/software/uploads/about/Mandatory%20Disclosure_JKKMCT-2025-26.pdf', 'https://jkkmct.edu.in/JKKMCT-NIRF2026.pdf',
    'https://www.jkkmct.edu.in/contact.php', 'pending', 'https://www.jkkmct.edu.in/', now()
  ),
(
    453, 'https://mcgansarch.com/',
    null, null,
    null, null,
    null, 'pending', 'https://mcgansarch.com/', now()
  ),
(
    455, 'https://jit.ac.in/',
    'https://jit.ac.in/#', 'https://jit.ac.in/ccr',
    'https://jit.ac.in/about-jit/mandatory-disclosure/', 'https://jit.ac.in/iqac/nirf/',
    'https://jit.ac.in/#', 'pending', 'https://jit.ac.in/', now()
  ),
(
    456, 'https://www.acetcbe.edu.in/',
    'https://www.acetcbe.edu.in/admission/', 'https://www.acetcbe.edu.in/placement/about-placement-cell/',
    'https://www.acetcbe.edu.in/wp-content/uploads/2026/05/Mandatory-disclossure-2025-2026-as-on-29-05-2026.pdf', 'https://www.acetcbe.edu.in/nirf/',
    'https://www.acetcbe.edu.in/contact-us/', 'pending', 'https://www.acetcbe.edu.in/', now()
  ),
(
    457, 'https://kpriet.ac.in/',
    'mailto:admission@kpriet.ac.in', 'https://kpriet.ac.in/placement',
    'https://kpriet.ac.in/aicte-mandatory-disclosure', 'https://kpriet.ac.in/accreditation/nirf',
    'https://kpriet.ac.in/contact', 'pending', 'https://kpriet.ac.in/', now()
  ),
(
    459, 'https://www.pct.ac.in/',
    null, null,
    'https://docs.google.com/forms/d/e/1FAIpQLSf-PiykKxlv3C3IuR6v4rjodOoT93kjXH-VY-mpui9Fx6X2pg/viewform?usp=sf_link', null,
    'https://www.pct.ac.in/aerospace_engineering.html', 'pending', 'https://www.pct.ac.in/', now()
  ),
(
    460, 'https://www.jct.ac.in/',
    'https://www.jct.ac.in/#admissions', 'https://www.jct.ac.in/#placements',
    'https://www.jct.ac.in/mandatory-disclosure/privacy', null,
    'https://www.jct.ac.in/contact', 'pending', 'https://www.jct.ac.in/', now()
  ),
(
    461, 'https://studyworldindia.com/',
    'https://studyworldindia.com/#', 'https://studyworldindia.com/training-placement/',
    'https://studyworldindia.com/#', null,
    'https://studyworldindia.com/contact-us/', 'pending', 'https://studyworldindia.com/', now()
  ),
(
    463, 'https://www.rvstcc.ac.in/',
    'https://www.rvstcc.ac.in/#', 'https://www.rvstcc.ac.in/#',
    'https://www.rvstcc.ac.in/wp-content/uploads/2026/02/Mandatory-Disclosure.pdf', 'https://www.rvstcc.ac.in/nirf/',
    null, 'pending', 'https://www.rvstcc.ac.in/', now()
  ),
(
    3, 'https://www.annauniv.edu/',
    'https://cfa.annauniv.edu/cfa', 'https://cuic.annauniv.edu/',
    'https://www.annauniv.edu/pdf/MandatoryDisclosure_2024-25.pdf', 'https://www.annauniv.edu/nirf.php',
    'https://www.annauniv.edu/contactus.php', 'pending', 'https://www.annauniv.edu/', now()
  ),
(
    466, 'https://aubit.edu.in/',
    'https://aubit.edu.in/wp-content/uploads/2024/08/Admission_Instructions2024cegov.pdf', 'https://aubit.edu.in/placement/',
    'https://aubit.edu.in/wp-content/uploads/2025/03/Mandatory-Disclosure-UCE-BIT-updated.pdf', 'https://aubit.edu.in/nirf/',
    'https://aubit.edu.in/first-year-contact/', 'pending', 'https://aubit.edu.in/', now()
  ),
(
    467, 'https://www.auucea.edu.in/',
    'https://auucea.edu.in/assets/assets/images/events/pdf/Admission_Instructions_2025.pdf', 'https://www.auucea.edu.in/train',
    'https://www.auucea.edu.in/event_detail21', 'https://www.auucea.edu.in/nirf',
    'https://www.auucea.edu.in/contact', 'pending', 'https://www.auucea.edu.in/', now()
  ),
(
    469, 'https://www.ucep.edu.in/',
    'https://www.ucep.edu.in/#', 'https://www.ucep.edu.in/placement.php',
    null, null,
    'https://www.ucep.edu.in/contact.php', 'pending', 'https://www.ucep.edu.in/', now()
  ),
(
    470, 'https://aucepkt.edu.in/',
    'https://aucepkt.edu.in/admission.php', 'https://aucepkt.edu.in/placement.php',
    'https://aucepkt.edu.in/assets/img/Mandatory-Disclosure-Updated-February-2024.pdf', null,
    'https://aucepkt.edu.in/contact.php', 'pending', 'https://aucepkt.edu.in/', now()
  ),
(
    471, 'https://mahalakshmitechcampus.com/',
    'https://mahalakshmitechcampus.com/#', 'https://mahalakshmitechcampus.com/training-and-placement/',
    'https://mahalakshmitechcampus.com/mandatory-disclosure/', null,
    'https://mahalakshmitechcampus.com/contact-us/', 'pending', 'https://mahalakshmitechcampus.com/', now()
  ),
(
    472, 'https://www.kcet.in/',
    'https://www.kcet.in/#', 'https://kcet.in/view-details/25/international-womens-day-celebration-2026',
    'https://kcet.in/uploads/documents/kcet/mandatory-disclosure-69df9ab5a497d.pdf', 'https://kcet.in/uploads/documents/kcet/national-institutional-ranking-framework-69ef231791b18.pdf',
    'https://kcet.in/page/29/contact-information', 'pending', 'https://www.kcet.in/', now()
  ),
(
    476, 'https://www.sriramakrishna.ac.in/',
    'https://www.sriramakrishna.ac.in/admission-form.html', 'https://www.sriramakrishna.ac.in/placement-cell.html',
    'https://www.sriramakrishna.ac.in/pdf/MANDATORY_DISCLOSUR_S-SRCE_2026.pdf', null,
    'https://www.sriramakrishna.ac.in/contact-us.html', 'pending', 'https://www.sriramakrishna.ac.in/', now()
  ),
(
    477, 'https://kskcet.edu.in/',
    'tel:+91%209942648026', 'https://kskcet.edu.in/placement/',
    'https://kskcet.edu.in/mandatory-disclosure/', 'http://kskcet.edu.in/wp-content/uploads/2024/03/K.S.K-College-of-Engineering-and-Technology-New20240308-.pdf',
    'https://kskcet.edu.in/contact-us/', 'pending', 'https://kskcet.edu.in/', now()
  ),
(
    479, 'https://www.aitech.org.in/',
    'https://www.aitech.org.in/admissions.php', 'https://aitech.org.in/placement',
    null, 'https://drive.google.com/file/d/1BZEyulF-K5QswdEjyl6TKXkVGBLIRyfr/view?usp=sharing',
    'https://www.google.com/maps/place/Arifa+Institute+of+Technology/@10.607459,79.757046,742m/data=!3m1!1e3!4m6!3m5!1s0x3a5567949dd3abf1:0x4abf15e35a8255db!8m2!3d10.607791!4d79.757002!16s%2Fg%2F1yg4m153z?entry=ttu&g_ep=EgoyMDI1MDkyMi4wIKXMDSoASAFQAw%3D%3D', 'pending', 'https://www.aitech.org.in/', now()
  ),
(
    483, 'https://nelliandavar.com/',
    null, null,
    null, null,
    null, 'pending', 'https://nelliandavar.com/', now()
  ),
(
    484, 'https://primenest.org/',
    null, null,
    null, null,
    'https://www.adonaifamilyhealthcare.com/contact-us/', 'pending', 'https://primenest.org/', now()
  ),
(
    485, 'https://krct.ac.in/',
    'https://krct.ac.in/admissions', 'https://krct.ac.in/placements',
    'https://krct.ac.in/ktgadmin/assets/php/pdf/1747801363.pdf', 'https://krct.ac.in/about.php?cat=0&id=39',
    null, 'pending', 'https://krct.ac.in/', now()
  ),
(
    486, 'https://sincet.ac.in/',
    'https://sincet.ac.in/#', 'https://sincet.ac.in/placement',
    'https://sincet.ac.in/pdf/self_disclosure/public_self_disclosure01.pdf', 'https://sincet.ac.in/nirf',
    'https://sincet.ac.in/contact', 'pending', 'https://sincet.ac.in/', now()
  ),
(
    488, 'https://www.oasys.edu.in/',
    'https://www.oasys.edu.in/#', 'https://www.oasys.edu.in/#',
    'https://www.oasys.edu.in/assets/disclosure-2025-2026.pdf', 'https://www.oasys.edu.in/#',
    'https://www.oasys.edu.in/contact-us.php', 'pending', 'https://www.oasys.edu.in/', now()
  ),
(
    490, 'https://care.ac.in/architecture/',
    'https://care.ac.in/architecture/admissions/', null,
    null, 'https://care.ac.in/architecture/nirf/',
    'https://care.ac.in/architecture/location/', 'pending', 'https://care.ac.in/architecture/', now()
  ),
(
    491, 'https://mamse.in/',
    'https://forms.gle/RsxLimDJYdqWHGvH8', 'https://mamse.in/#',
    'https://mamse.in/md/25_26/MD_25_26.pdf', null,
    'https://mamse.in/contact.html', 'pending', 'https://mamse.in/', now()
  ),
(
    492, 'https://trp.srmtrichy.edu.in/',
    'https://docs.google.com/forms/d/e/1FAIpQLSfdgvhOq3oSS5qzPqt1kVCkvxrrVt2adEbSftugSNRXqoPsWw/viewform', 'https://trp.srmtrichy.edu.in/placement/',
    'https://trp.srmtrichy.edu.in/ugc-public-self-disclosure/', 'https://trp.srmtrichy.edu.in/nirf-2025/',
    null, 'pending', 'https://trp.srmtrichy.edu.in/', now()
  ),
(
    493, 'https://www.avccengg.net/',
    'https://www.avccengg.net/documents/activities/prospectus.pdf', 'https://www.avccengg.net/documents/activities/placement_prospectus.pdf',
    'https://www.avccengg.net/Aicte/Disclosures', 'https://avccengg.net/AboutUs/Nirf',
    'https://www.avccengg.net/Academic/Contacts', 'pending', 'https://www.avccengg.net/', now()
  ),
(
    495, 'https://www.aamec.edu.in/',
    'https://www.aamec.edu.in/admission', 'https://www.aamec.edu.in/placements',
    'https://a.storyblok.com/f/286279/x/605f71f757/mandatory-disclosure-18-05-2026.pdf', 'https://a.storyblok.com/f/286279/x/baa449ff5b/nirf-2025.pdf',
    null, 'pending', 'https://www.aamec.edu.in/', now()
  ),
(
    496, 'https://aec.org.in/',
    'https://docs.google.com/forms/d/e/1FAIpQLScMd3nSkM2MJ9AnJWHeAeZ7DybiCb4t8WS0lTYokZgEsCn28A/viewform', 'https://aec.org.in/training-and-placement-cell/',
    'https://aec.org.in/wp-content/uploads/2025/10/MANDATORY_DISCLOSURE_2025-26.pdf', 'https://aec.org.in/wp-content/uploads/2025/02/NIRF25-Overall.pdf',
    'https://aec.org.in/contact/', 'pending', 'https://aec.org.in/', now()
  ),
(
    497, 'https://www.dsengg.ac.in/',
    'https://dsengg.ac.in/admission', null,
    'https://dsengg.ac.in/mandatory-disclosure', 'https://dsengg.ac.in/uploads/nrif/nirf_DSEC_Engineering_NIRF_2026.pdf',
    'https://dsengg.ac.in/contact', 'pending', 'https://www.dsengg.ac.in/', now()
  ),
(
    498, 'https://www.egspec.org/',
    'https://www.egspec.org/#', 'https://www.egspec.org/#',
    'https://www.egspec.org/mandatory-disclosure', 'https://www.egspec.org/national-institutional-ranking-framework',
    'https://www.egspec.org/support/contact-us', 'pending', 'https://www.egspec.org/', now()
  ),
(
    500, 'https://www.jayaramcet.edu.in/',
    'https://docs.google.com/forms/d/e/1FAIpQLSciknIL02FS2E6xdAU_KGouYawLA0YwUV5UixSO5uqkccFQXw/viewform', 'https://www.jayaramcet.edu.in/Placement.html',
    null, 'https://www.jayaramcet.edu.in/NIRF.html',
    'https://www.jayaramcet.edu.in/admissions/contact', 'pending', 'https://www.jayaramcet.edu.in/', now()
  ),
(
    502, 'https://www.mamce.org/',
    'https://www.mamce.org/new-adminssion-fees', 'https://www.mamce.org/placement',
    'https://www.mamce.org/public/Mandatory_disclosure_2025_2026.pdf', 'https://www.mamce.org/public/images/Mamce-NIRF.pdf',
    'https://www.mamce.org/contact', 'pending', 'https://www.mamce.org/', now()
  ),
(
    503, 'https://www.miet.edu/',
    'https://www.miet.edu/#', 'https://www.miet.edu/placements.html',
    'https://www.miet.edu/pdf2/MANDATORY-DISCLOSURE-2023-2024.pdf', 'https://www.miet.edu/pdf2/Over%20All%202026%20(2024-25).pdf',
    'https://www.miet.edu/contact.html', 'pending', 'https://www.miet.edu/', now()
  ),
(
    504, 'https://www.mookambigai.ac.in/',
    'https://www.mookambigai.ac.in/pdf/admission.pdf', 'https://www.mookambigai.ac.in/#',
    'https://www.mookambigai.ac.in/pdf/MANDATORY-DISCLOSURE.pdf', null,
    'https://www.mookambigai.ac.in/iic-contact.php', 'pending', 'https://www.mookambigai.ac.in/', now()
  ),
(
    505, 'https://oxfordec.edu.in/',
    'https://oxfordec.edu.in/#', null,
    'https://oxfordec.edu.in/wp-content/uploads/2024/05/MANDATORY-DISCLOSURE-2023-2024.pdf', null,
    'https://oxfordec.edu.in/contact-us-2/', 'pending', 'https://oxfordec.edu.in/', now()
  ),
(
    508, 'https://roeverengg.edu.in/',
    'https://roeverengg.edu.in/admission/', 'https://roeverengg.edu.in/placements/',
    'https://roeverengg.edu.in/uploads/MD/MD.pdf', 'https://roeverengg.edu.in/reports/#NIRF_Reports',
    'https://roeverengg.edu.in/contact-us/', 'pending', 'https://roeverengg.edu.in/', now()
  ),
(
    509, 'https://www.saranathan.ac.in/',
    'https://www.saranathan.ac.in/admission.php?tgt=courses', 'https://www.saranathan.ac.in/placement.php?tgt=placement',
    'https://www.saranathan.ac.in/mandatory.php', 'https://www.saranathan.ac.in/home.php?tgt=nirf',
    'http://www.saranathan.ac.in/contactus.php', 'pending', 'https://www.saranathan.ac.in/', now()
  ),
(
    510, 'https://www.trichyengg.ac.in/',
    'mailto:admissions@trichyengg.ac.in', 'https://www.trichyengg.ac.in/placement-cell.html',
    'https://www.trichyengg.ac.in/pdf/manda.pdf', null,
    'https://www.trichyengg.ac.in/campus-location-size.html', 'pending', 'https://www.trichyengg.ac.in/', now()
  ),
(
    512, 'https://www.drnnce.ac.in/',
    'https://www.drnnce.ac.in/Admission.html', 'https://www.drnnce.ac.in/Placement.html',
    'https://www.drnnce.ac.in/info/mandatory.pdf', null,
    'https://www.drnnce.ac.in/Contact.html', 'pending', 'https://www.drnnce.ac.in/', now()
  ),
(
    513, 'https://sjcettnj.edu.in/',
    'https://admissions.dmifoundations.org/st-joseph-college-of-engineering-and-technology-application-form', 'https://sjcettnj.edu.in/#',
    'https://sjcettnj.edu.in/static/md.pdf', 'https://sjcettnj.edu.in/homenirf.php',
    'https://sjcettnj.edu.in/admission/contact.php', 'pending', 'https://sjcettnj.edu.in/', now()
  ),
(
    514, 'https://kongunadu.ac.in/',
    'https://kongunadu.ac.in/#', 'https://kongunadu.ac.in/#',
    'https://kongunadu.ac.in/mandatory-disclosure-3/', 'https://kongunadu.ac.in/nirf-rankings/',
    'https://kongunadu.ac.in/contact-research-coordinator/', 'pending', 'https://kongunadu.ac.in/', now()
  ),
(
    515, 'https://mamcet.com/',
    'https://www.mycamu.co.in/onlineapplication?id=61715bc25ea9087c042eb562', 'https://mamcet.com/placement/',
    'http://mamcet.com/wp-content/uploads/2026/05/Mandatory-Disclosure-Final-MAMCET.pdf', 'http://mamcet.com/wp-content/uploads/2026/04/M.-A.-M.-College-of-Engineering-and-Technology20260306-.pdf',
    'https://mamcet.com/contacts/', 'pending', 'https://mamcet.com/', now()
  ),
(
    516, 'https://www.krce.ac.in/',
    'https://www.krce.ac.in/admissions.html', 'https://www.krce.ac.in/placement.html',
    'https://www.krce.ac.in/pdf/mandatorynew.pdf', 'https://www.krce.ac.in/NIRF.html',
    'https://www.krce.ac.in/contact.html', 'pending', 'https://www.krce.ac.in/', now()
  ),
(
    517, 'https://www.igceng.com/',
    'https://joining.indraganesan.org/', 'https://www.igceng.com/#placements',
    null, null,
    null, 'pending', 'https://www.igceng.com/', now()
  ),
(
    518, 'https://www.parisuthamtech.com/',
    'https://www.parisuthamtech.com/admission.htm', 'http://parisuthamtech.com/placement.pdf',
    'https://www.parisuthamtech.com/mandatory-disclosure.htm', 'https://www.parisuthamtech.com/nirf.htm',
    'https://www.parisuthamtech.com/#', 'pending', 'https://www.parisuthamtech.com/', now()
  ),
(
    519, 'https://care.ac.in/',
    'http://care.ac.in/arts/', null,
    null, null,
    null, 'pending', 'https://care.ac.in/', now()
  ),
(
    520, 'https://mrkit.edu.in/',
    'https://mrkit.edu.in/admission-cell', 'https://mrkit.edu.in/placement-goals-and-objective',
    'https://mrkit.edu.in/assets/pdf/Mandatory-Disclosure-2025-26.pdf', 'https://mrkit.edu.in/nirf',
    'https://mrkit.edu.in/contact', 'pending', 'https://mrkit.edu.in/', now()
  ),
(
    521, 'https://www.shivani.ac.in/',
    'https://www.shivani.ac.in/admission', 'https://www.shivani.ac.in/placement',
    'https://a.storyblok.com/f/299015/x/1bb39ac7c9/university-grants-commission-public-self-disclosure.pdf', null,
    null, 'pending', 'https://www.shivani.ac.in/', now()
  ),
(
    522, 'https://www.imayam.com/',
    null, null,
    null, null,
    null, 'pending', 'https://www.imayam.com/', now()
  ),
(
    523, 'https://www.mtcet.in/',
    'https://www.mtcet.in/latest1.html', 'https://www.mtcet.in/placement.html',
    'https://www.mtcet.in/mandatorygisclosure.html', 'https://www.mtcet.in/nirf.html',
    'https://www.mtcet.in/contact.html', 'pending', 'https://www.mtcet.in/', now()
  ),
(
    525, 'https://www.annaiengg.org/',
    'https://www.annaiengg.org/admissions.php', 'https://www.annaiengg.org/placements.php',
    'https://www.annaiengg.org/mandatory-disclosure.php', null,
    'https://www.annaiengg.org/contact.php', 'pending', 'https://www.annaiengg.org/', now()
  ),
(
    527, 'https://www.sbec.edu.in/',
    'https://www.sbec.edu.in/admission.php', 'https://www.sbec.edu.in/placement.php',
    'https://www.sbec.edu.in/assets/image/Mandatory-Disclosure%202026-2027.pdf', 'https://www.sbec.edu.in/NIRF/NIRF_2022-23.pdf',
    'https://www.sbec.edu.in/contact.php', 'pending', 'https://www.sbec.edu.in/', now()
  ),
(
    528, 'https://5-starstaffing.com/',
    null, null,
    null, null,
    'https://5-starstaffing.com/', 'pending', 'https://5-starstaffing.com/', now()
  ),
(
    531, 'https://www.srvgroups.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.srvgroups.in/', now()
  ),
(
    532, 'https://www.stannescet.ac.in/',
    'https://www.stannescet.ac.in/admission/', 'https://www.stannescet.ac.in/placement',
    'https://www.stannescet.ac.in/media/files/St_Annes_Mandatory_Disclosure_JUNE2026.pdf', 'https://www.stannescet.ac.in/media/files/SANCET-NIRF-2026.pdf',
    'https://www.stannescet.ac.in/contact', 'pending', 'https://www.stannescet.ac.in/', now()
  ),
(
    533, 'https://www.kingsengg.edu.in/',
    'https://www.kingsengg.edu.in/pdf/scroll/MBA%20Brochure_2026-27.jpeg', 'https://www.kingsengg.edu.in/tp.html',
    'https://www.kingsengg.edu.in/Md_25-26.pdf', 'https://www.kingsengg.edu.in/pdf/main/NIRF-25-26.pdf',
    'https://www.kingsengg.edu.in/contact.html', 'pending', 'https://www.kingsengg.edu.in/', now()
  ),
(
    534, 'https://www.mzcet.in/',
    'https://www.mzcet.in/#admissions', 'https://www.mzcet.in/placement.html',
    'https://www.mzcet.in/assets/pf/mandatory%20disclosure.pdf', 'https://www.mzcet.in/assets/nirf.pdf',
    null, 'pending', 'https://www.mzcet.in/', now()
  ),
(
    535, 'https://snec.ac.in/',
    'https://snec.ac.in/application_form.php', 'https://snec.ac.in/#',
    'https://snec.ac.in/assets/pdf/mandatary.pdf', 'https://snec.ac.in/assets/pdf/nirf1.pdf',
    'https://snec.ac.in/contact.php', 'pending', 'https://snec.ac.in/', now()
  ),
(
    536, 'https://www.sec.ac.in/',
    'https://www.sec.ac.in/#', 'https://www.sec.ac.in/placement.php',
    'https://www.sec.ac.in/assets/pdf/mandatory-disclosure-may-2026.pdf', 'https://www.sec.ac.in/assets/pdf/naac-certificate.pdf',
    'https://www.sec.ac.in/#', 'pending', 'https://www.sec.ac.in/', now()
  ),
(
    537, 'https://www.mnsk.ac.in/',
    'https://www.mnsk.ac.in/admission.php', 'https://www.mnsk.ac.in/placement.php',
    'https://www.mnsk.ac.in/pdf/MNSK_Complete_Mandatory_Disclosure.pdf', null,
    'https://www.mnsk.ac.in/contactus.php', 'pending', 'https://www.mnsk.ac.in/', now()
  ),
(
    539, 'https://auttvl.ac.in/',
    'https://auttvl.ac.in/recruitment/ADv%20CMRG__suja%20CMRG250993.pdf', null,
    null, null,
    null, 'pending', 'https://auttvl.ac.in/', now()
  ),
(
    540, 'https://www.ucen.ac.in/',
    'https://ucen.ac.in/docs/fee_2025/B.E-B.Techand-MBAFeesStructure.pdf', 'https://www.ucen.ac.in/placement/',
    'https://www.ucen.ac.in/docs/common/AICTE%20MANDATORY%20DISCLOSURE.pdf', 'https://www.ucen.ac.in/#',
    'https://www.ucen.ac.in/contact/', 'pending', 'https://www.ucen.ac.in/', now()
  ),
(
    541, 'http://www.annaunivtut.in/',
    'http://www.annaunivtut.in/doc/Application%20of%20the%20Transfercum%20%20Conduct%20certificate.pdf', 'http://www.annaunivtut.in/placement.html',
    'http://www.annaunivtut.in/doc/Mandatory%20Disclosure%202026-2027.pdf', null,
    null, 'pending', 'http://www.annaunivtut.in/', now()
  ),
(
    542, 'https://tec-edu.in/index',
    'https://docs.google.com/forms/d/e/1FAIpQLSetl3T9FSPuHFgTtwst3iZ7f1gw-xry0PnhZBL8oaUL28CwRA/viewform', 'javascript:void(0)',
    'https://tec-edu.in/mandatory-disclosure', null,
    'https://tec-edu.in/contact-us', 'pending', 'https://tec-edu.in/index', now()
  ),
(
    543, 'https://www.rcet.org.in/',
    'https://www.rcet.org.in/#', 'https://www.rcet.org.in/departments.php?dept=training&dmenu=About',
    null, 'https://www.rcet.org.in/nirf',
    'https://www.rcet.org.in/contact-us', 'pending', 'https://www.rcet.org.in/', now()
  ),
(
    544, 'https://sigmacollege.edu.in/',
    'https://sigmacollege.edu.in/registration', 'https://sigmacollege.edu.in/placements',
    null, 'https://sigmacollege.edu.in/sigma/files/SICA-NIRF%202026.pdf',
    'https://sigmacollege.edu.in/contact-us', 'pending', 'https://sigmacollege.edu.in/', now()
  ),
(
    545, 'https://www.stellamaryscoe.edu.in/',
    'https://www.stellamaryscoe.edu.in/#', 'https://www.stellamaryscoe.edu.in/placement_home.php',
    'https://www.stellamaryscoe.edu.in/mandatorydisclosure.php', 'https://camps.stellamaryscoe.edu.in/CAMPS/viewdoc.php?dt_id=12454',
    null, 'pending', 'https://www.stellamaryscoe.edu.in/', now()
  ),
(
    546, 'http://www.unienggtech.com/',
    'http://www.unienggtech.com/#', 'http://www.unienggtech.com/#',
    null, null,
    'http://www.unienggtech.com/contact.php', 'pending', 'http://www.unienggtech.com/', now()
  ),
(
    547, 'https://rvce.ac.in/',
    'https://rvce.ac.in/admissions/', 'https://rvce.ac.in/#',
    'https://rvce.ac.in/regulations/', null,
    'https://rvce.ac.in/contact-us/', 'pending', 'https://rvce.ac.in/', now()
  ),
(
    549, 'https://www.ritrjpm.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.ritrjpm.ac.in/', now()
  ),
(
    551, 'https://aaaenggcoll.ac.in/',
    'https://aaaenggcoll.ac.in/admission/', 'https://aaaenggcoll.ac.in/#',
    null, null,
    'https://aaaenggcoll.ac.in/contact-us/', 'pending', 'https://aaaenggcoll.ac.in/', now()
  ),
(
    552, 'https://gscet.org/',
    'https://gscet.org/admission/', 'https://gscet.org/training-placement/',
    'https://gscet.org/mandatory-disclosure/', null,
    'https://gscet.org/contact/', 'pending', 'https://gscet.org/', now()
  ),
(
    554, 'https://sethu.ac.in/',
    'http://admission.sethu.ac.in/', 'https://sethu.ac.in/best-placement-engineering-colleges-in-madurai/',
    'https://sethu.ac.in/wp-content/uploads/2025/07/MANDATORY-DISCLOSURE-2025.pdf', 'https://sethu.ac.in/nirf/',
    'https://sethu.ac.in/top-private-engineering-colleges-in-tamilnadu/', 'pending', 'https://sethu.ac.in/', now()
  ),
(
    558, 'https://metcolleges.in/',
    'https://metcolleges.in/admission_enquiry/', 'https://metcolleges.in/placements/',
    'https://metcolleges.in/mandatory-disclosure/', null,
    'https://metcolleges.in/contact/', 'pending', 'https://metcolleges.in/', now()
  ),
(
    559, 'https://grace.edu.in/',
    'https://grace.edu.in/Admin', 'https://grace.edu.in/placement',
    null, null,
    'https://grace.edu.in/helpdesk', 'pending', 'https://grace.edu.in/', now()
  ),
(
    562, 'https://www.holycrossengineeringcollege.com/',
    'https://www.holycrossengineeringcollege.com/admissions.html', 'https://www.holycrossengineeringcollege.com/placement.php.html',
    null, null,
    'https://www.holycrossengineeringcollege.com/contact.php.html', 'pending', 'https://www.holycrossengineeringcollege.com/', now()
  ),
(
    564, 'https://www.sivajicollegeofengineering.com/',
    null, null,
    null, null,
    null, 'pending', 'https://www.sivajicollegeofengineering.com/', now()
  ),
(
    565, 'https://uitkovilpatti.ac.in/',
    'https://uitkovilpatti.ac.in/enquiry/', 'https://uitkovilpatti.ac.in/placement/',
    'https://uitkovilpatti.ac.in/wp-content/uploads/2025/05/MD24-25.pdf', 'https://uitkovilpatti.ac.in/Files/NIRF.pdf',
    'https://uitkovilpatti.ac.in/contact/', 'pending', 'https://uitkovilpatti.ac.in/', now()
  ),
(
    567, 'https://www.arunachalacollege.com/',
    'https://www.arunachalacollege.com/admission_contact.php', 'https://www.arunachalacollege.com/#',
    'https://arunachalacollege.com/pdf/ugc/about.pdf', 'https://www.arunachalacollege.com/nirf.php',
    'https://www.arunachalacollege.com/contact_us.php', 'pending', 'https://www.arunachalacollege.com/', now()
  ),
(
    568, 'https://www.dmiengg.edu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.dmiengg.edu.in/', now()
  ),
(
    569, 'https://stopnote.vhostgo.com/?host=www%2Erit%2Ecc&refer=',
    null, null,
    null, null,
    null, 'pending', 'https://stopnote.vhostgo.com/?host=www%2Erit%2Ecc&refer=', now()
  ),
(
    570, 'https://www.psnits.ac.in/',
    'https://www.psnits.ac.in/online-admission', 'https://www.psnits.ac.in/Home/Training_Process',
    'https://www.psnits.ac.in/assets/img/Public_Disclosure.pdf', null,
    'https://www.psnits.ac.in/contact-us', 'pending', 'https://www.psnits.ac.in/', now()
  ),
(
    571, 'https://www.csiit.ac.in/',
    'https://www.csiit.ac.in/wp-content/themes/csiit/images/UGApplnForm.pdf', 'https://www.csiit.ac.in/placement/',
    null, 'https://www.csiit.ac.in/nirf/',
    'https://www.csiit.ac.in/contact-us/', 'pending', 'https://www.csiit.ac.in/', now()
  ),
(
    572, 'https://www.capeitech.org/',
    'https://www.capeitech.org/admissions.php', 'https://www.capeitech.org/placements/partners.php',
    'https://www.capeitech.org/assets/naac/mandatory-disclosure-1.pdf', null,
    'https://www.capeitech.org/contact.php', 'pending', 'https://www.capeitech.org/', now()
  ),
(
    573, 'https://drsacoe.org/',
    null, null,
    null, null,
    null, 'pending', 'https://drsacoe.org/', now()
  ),
(
    574, 'https://www.francisxavier.ac.in/',
    'https://www.francisxavier.ac.in/#', 'https://www.francisxavier.ac.in/placements',
    'https://francisxavier.ac.in/cs-content/uploads/Footer/FXEC_Mandatory_Disclosure_2026.pdf', 'https://www.francisxavier.ac.in/national-institutional-ranking-framework',
    'https://www.francisxavier.ac.in/contact', 'pending', 'https://www.francisxavier.ac.in/', now()
  ),
(
    575, 'https://jayamatha.org/',
    'https://jayamatha.org/admform.php', 'https://jayamatha.org/placement.php',
    'https://jayamatha.org/assets/pdf/Mandatory%20Disclosure%20JEC.pdf', null,
    'https://jayamatha.org/contact-us.php', 'pending', 'https://jayamatha.org/', now()
  ),
(
    576, 'https://www.jacsicoe.in/',
    'https://www.jacsicoe.in/#', 'https://www.jacsicoe.in/#',
    'https://www.jacsicoe.in/pdf/Info/Mandatory%20Disclosure%20New.pdf', null,
    'https://www.jacsicoe.in/contact-us.php', 'pending', 'https://www.jacsicoe.in/', now()
  ),
(
    577, 'https://www.kamarajengg.edu.in/',
    'https://www.kamarajengg.edu.in/admission', 'https://www.kamarajengg.edu.in/tdpc',
    'https://www.kamarajengg.edu.in/media/MANDATORY%20DISCLOSURE25.pdf', 'https://www.kamarajengg.edu.in/media/NIRF-PAT.xlsx',
    'https://www.kamarajengg.edu.in/coecontact', 'pending', 'https://www.kamarajengg.edu.in/', now()
  ),
(
    578, 'https://www.mepcoeng.ac.in/',
    'https://www.mepcoeng.ac.in/admission/Eligibility.aspx', 'https://www.mepcoeng.ac.in/placement/PlacementHome.aspx',
    'https://www.mepcoeng.ac.in/docs/footerlink/Mandatory_Disclosure-Nov-2025.pdf', 'https://www.nirfindia.org/Rankings/2025/EngineeringRanking200.html',
    'https://www.mepcoeng.ac.in/contact.html', 'pending', 'https://www.mepcoeng.ac.in/', now()
  ),
(
    579, 'https://nce.ac.in/',
    'https://nce.ac.in/?page_id=209', 'https://nce.ac.in/?page_id=3699',
    'https://nce.ac.in/mandatorydisclosure/', null,
    'https://nce.ac.in/contact-us/', 'pending', 'https://nce.ac.in/', now()
  ),
(
    580, 'https://nec.edu.in/',
    'https://nec.edu.in/#', 'https://nec.edu.in/placement/',
    'https://nec.edu.in/#', 'https://nec.edu.in/national-institutional-ranking-framework-nirf/',
    'https://nec.edu.in/research-contact/', 'pending', 'https://nec.edu.in/', now()
  ),
(
    581, 'https://psncet.ac.in/',
    'https://docs.google.com/forms/d/e/1FAIpQLSds87o-mNNTTU9rzjAod-BjkOAEszD9a6Q2eD82l9idIqXbVw/viewform?usp=sharing&#038;ouid=101049981770551995769', 'https://psncet.ac.in/placement-and-training-home/',
    'https://psncet.ac.in/wp-content/uploads/2025/07/Mandatory-Disclousure-2025-26-final.pdf', 'https://psncet.ac.in/wp-content/uploads/2026/04/NIRF-2026-1.pdf',
    'https://psncet.ac.in/contact/', 'pending', 'https://psncet.ac.in/', now()
  ),
(
    582, 'https://psr.edu.in/',
    'https://forms.gle/3Dq6VDftzorgQS4KA', 'http://psr.edu.in/placement/',
    'http://psr.edu.in/wp-content/uploads/2025/07/Mandatory-Disclosures-2025-26.pdf', 'http://psr.edu.in/nirf/',
    'https://psr.edu.in/contact/', 'pending', 'https://psr.edu.in/', now()
  ),
(
    583, 'https://www.petengg.ac.in/',
    'https://www.petengg.ac.in/admissions.php?T1MyUzJzai95YUpuSENrZTdRcHp3dz09', 'https://www.petengg.ac.in/placement.php?RDYyOU94UnVxRitZSnh6TDNhWC9RZz09',
    'https://www.petengg.ac.in/pdfs/Minimum_Disclosure.pdf', null,
    'https://www.petengg.ac.in/#contact', 'pending', 'https://www.petengg.ac.in/', now()
  ),
(
    584, 'https://www.svccollege.ac.in/',
    'http://test.studentsunion.in/institute/applynow?id=ZTEyYWYzNTY4MWQ2NmU0NmQ0YmYxNGMzN2FkNTRjMGQ=#', 'https://www.svccollege.ac.in/placement%20Drive.pdf',
    'https://www.svccollege.ac.in/SVCET%20Mandatory%20Disclosure%202020n.pdf', null,
    'https://www.svccollege.ac.in/contact-us.html', 'pending', 'https://www.svccollege.ac.in/', now()
  ),
(
    585, 'https://src.org.in/',
    'https://src.org.in/mca/', 'https://src.org.in/2026/01/28/placement/',
    'https://src.org.in/wp-content/uploads/2026/05/sardar-raja-college-of-engineering-2026-2027.pdf', null,
    'https://src.org.in/contact-us/', 'pending', 'https://src.org.in/', now()
  ),
(
    586, 'https://scadengineering.ac.in/',
    'https://forms.gle/LLYadCKSxL9reYvm7', 'https://scadengineering.ac.in/#',
    'https://scadengineering.ac.in/wp-content/uploads/2026/04/Mandatory-Disclosure-25-26-1.pdf', 'https://scadengineering.ac.in/nirf/',
    'https://scadengineering.ac.in/index.php/contact-us-scad/', 'pending', 'https://scadengineering.ac.in/', now()
  ),
(
    587, 'https://www.sowdambikaengg.edu.in/',
    null, 'https://www.sowdambikaengg.edu.in/depts/patssce/index.html',
    null, 'https://www.sowdambikaengg.edu.in/NIRF26.pdf',
    'https://www.sowdambikaengg.edu.in/docs/about.html', 'pending', 'https://www.sowdambikaengg.edu.in/', now()
  ),
(
    588, 'https://www.sxcce.edu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.sxcce.edu.in/', now()
  ),
(
    589, 'https://amrita.edu.in/',
    'https://amrita.edu.in/admissions.php', 'https://amrita.edu.in/#',
    'https://amrita.edu.in/docs/AY23-24/MANDATORY%20DISCLOSURE%202023-2024.pdf#toolbar=0', 'https://amrita.edu.in/nirf.php',
    'https://amrita.edu.in/#', 'pending', 'https://amrita.edu.in/', now()
  ),
(
    590, 'https://www.gcetly.ac.in/',
    'https://www.gcetly.ac.in/#', 'https://www.gcetly.ac.in/placement.php',
    null, 'https://www.gcetly.ac.in/nirfnew.php',
    'https://www.gcetly.ac.in/contactus.php', 'pending', 'https://www.gcetly.ac.in/', now()
  ),
(
    591, 'https://drgupopeengg.org/',
    'https://drgupopeengg.org/admissions/', 'https://drgupopeengg.org/placement/',
    null, 'https://drgupopeengg.org/#',
    'https://drgupopeengg.org/contact/', 'pending', 'https://drgupopeengg.org/', now()
  ),
(
    592, 'https://www.ijce.ac.in/',
    'https://www.ijce.ac.in/admission.php', 'https://www.ijce.ac.in/placements.php',
    null, 'https://www.ijce.ac.in/accreditations-nirf.php',
    'https://www.ijce.ac.in/contact-us.php', 'pending', 'https://www.ijce.ac.in/', now()
  ),
(
    593, 'https://www.ngce.ac.in/',
    'https://www.ngce.ac.in/#', 'https://www.ngce.ac.in/#',
    null, null,
    'https://www.ngce.ac.in/contact-us/', 'pending', 'https://www.ngce.ac.in/', now()
  ),
(
    594, 'http://www.udayaschoolofengineering.com/',
    'http://www.udayaschoolofengineering.com/admission.php', 'http://www.udayaschoolofengineering.com/#',
    'http://www.udayaschoolofengineering.com/notice/Mandatory_Disclosers_%202026-27.pdf', null,
    'http://www.udayaschoolofengineering.com/contact.php', 'pending', 'http://www.udayaschoolofengineering.com/', now()
  ),
(
    596, 'https://www.einsteincollege.ac.in/',
    'https://www.einsteincollege.ac.in/admissions/', 'https://www.einsteincollege.ac.in/#',
    'https://www.einsteincollege.ac.in/wp-content/uploads/2025/07/Mandatory-disclosure-2025.pdf', null,
    'https://www.einsteincollege.ac.in/contact-us/', 'pending', 'https://www.einsteincollege.ac.in/', now()
  ),
(
    597, 'https://www.ponjesly.ac.in/',
    'http://./', 'https://www.ponjesly.ac.in/placement-cell/',
    null, null,
    'https://www.ponjesly.ac.in/contact-us/', 'pending', 'https://www.ponjesly.ac.in/', now()
  ),
(
    598, 'https://vinsengineeringcollege.org/',
    'https://vinsengineeringcollege.org/#', 'https://vinsengineeringcollege.org/#',
    'https://vinsengineeringcollege.org/download.php?file=mandatory_disclosure.pdf&op=1', 'https://vinsengineeringcollege.org/includes/documents/nirf.pdf',
    'https://vinsengineeringcollege.org/placement.php?type=3#section3', 'pending', 'https://vinsengineeringcollege.org/', now()
  ),
(
    599, 'https://www.ljcet.org/',
    'https://www.ljcet.org/admission.php', 'https://www.ljcet.org/placement.php',
    'https://www.ljcet.org/assets/LJCET%20Mandatory%20Disclosure%202024-25.pdf', 'https://www.ljcet.org/assets/nirf.pdf',
    'https://www.ljcet.org/contact.php', 'pending', 'https://www.ljcet.org/', now()
  ),
(
    600, 'https://www.macet.edu.in/',
    'https://www.macet.edu.in/Admission.php', 'https://www.macet.edu.in/Placement.php',
    null, null,
    null, 'pending', 'https://www.macet.edu.in/', now()
  ),
(
    601, 'https://www.psnec.ac.in/',
    'https://www.psnec.ac.in/#', 'https://www.psnec.ac.in/placement.php',
    'https://www.psnec.ac.in/assets/pdf/Mandatory-Disclousure-psnec-May-31-2024.pdf', 'https://www.psnec.ac.in/NIRF.pdf',
    'https://www.psnec.ac.in/contact.php', 'pending', 'https://www.psnec.ac.in/', now()
  ),
(
    602, 'http://bethlahem.org/engineering/frontend/web/index.php/main/index',
    'http://bethlahem.org/engineering/frontend/web/index.php/admission/form', 'http://bethlahem.org/engineering/frontend/web/placement/placementcell',
    'http://bethlahem.org/engineering/frontend/web/disclosure/disclosure', null,
    'tel:+918056420728', 'pending', 'http://bethlahem.org/engineering/frontend/web/index.php/main/index', now()
  ),
(
    603, 'https://www.lites.edu.in/',
    'https://www.lites.edu.in/#', 'https://www.lites.edu.in/Placement/Placement_and_Training',
    'https://www.lites.edu.in/Page/Mandatory_Disclosure', 'https://www.lites.edu.in/Page/NIRF',
    'javascript:void(0);', 'pending', 'https://www.lites.edu.in/', now()
  ),
(
    604, 'https://www.jpcoe.ac.in/',
    'https://admissions.dmifoundations.org/jp-college-of-engineering-application-form', 'https://www.jpcoe.ac.in/?p=placement',
    'https://www.jpcoe.ac.in/pdfs/Mandatory_Disclosure.pdf', 'https://www.jpcoe.ac.in/#',
    'https://www.jpcoe.ac.in/?p=contact_us', 'pending', 'https://www.jpcoe.ac.in/', now()
  ),
(
    605, 'https://psrr.edu.in/',
    'https://psrr.edu.in/admission-apply-now/', 'https://psrr.edu.in/placement/',
    'https://psrr.edu.in/wp-content/uploads/2025/08/Mandatory-Disclosures-2024-25.pdf', null,
    'https://psrr.edu.in/contact/', 'pending', 'https://psrr.edu.in/', now()
  ),
(
    606, 'https://www.srividyaengg.ac.in/',
    'https://www.srividyaengg.ac.in/admission_form.php', 'https://www.srividyaengg.ac.in/placements.php',
    'https://www.srividyaengg.ac.in/files/Mandatory%20DisclosureSigned%202026-27.pdf', 'javascript:void(0)',
    null, 'pending', 'https://www.srividyaengg.ac.in/', now()
  ),
(
    608, 'https://www.avce.edu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.avce.edu.in/', now()
  ),
(
    5, 'https://www.annamalaiuniversity.ac.in/',
    'https://www.annamalaiuniversity.ac.in/adm/index.php', 'https://www.annamalaiuniversity.ac.in/stud_placement_new.php',
    null, null,
    null, 'pending', 'https://www.annamalaiuniversity.ac.in/', now()
  ),
(
    609, 'https://www.tce.edu/',
    'https://www.tce.edu/#', 'https://www.tce.edu/#',
    'https://www.tce.edu/about/mandatory-disclosure', 'https://www.tce.edu/nirf/ranking',
    'https://www.tce.edu/cdc/contact-us', 'pending', 'https://www.tce.edu/', now()
  ),
(
    611, 'https://autmdu.in/',
    null, null,
    null, null,
    null, 'pending', 'https://autmdu.in/', now()
  ),
(
    612, 'https://cecri.res.in/',
    null, null,
    null, null,
    null, 'pending', 'https://cecri.res.in/', now()
  ),
(
    613, 'https://www.aucermd.edu.in/',
    'https://www.aucermd.edu.in/#', 'https://www.aucermd.edu.in/#',
    'https://aucermd.edu.in/Files/pdf/Mandatory%20Disclosure/MDC_UCER.pdf', null,
    'https://www.aucermd.edu.in/contact-us/', 'pending', 'https://www.aucermd.edu.in/', now()
  ),
(
    614, 'https://auucedgl.ac.in/',
    'https://auucedgl.ac.in/#', 'https://auucedgl.ac.in/#',
    'https://auucedgl.ac.in/wp-content/uploads/2026/04/MandatoryDisclosure-UCE-DGL-2026.pdf', null,
    'https://auucedgl.ac.in/#', 'pending', 'https://auucedgl.ac.in/', now()
  ),
(
    615, 'https://www.sriraajaraajan.in/',
    'https://www.sriraajaraajan.in/admission.php', 'https://www.sriraajaraajan.in/placement.php',
    'https://www.sriraajaraajan.in/disclosure1.php', 'https://www.sriraajaraajan.in/img/need/SRRCET%20-%20NIRF%20DCS%20REPORT.pdf',
    'https://www.sriraajaraajan.in/contact1.php', 'pending', 'https://www.sriraajaraajan.in/', now()
  ),
(
    617, 'https://www.vaigai.org/',
    'https://www.vaigai.org/#', null,
    null, null,
    'https://www.vaigai.org/#', 'pending', 'https://www.vaigai.org/', now()
  ),
(
    618, 'https://www.kitandkimtechnicalcampus.org/',
    'https://auxiliumcollege.ac.in/admission/', 'https://www.kitandkimtechnicalcampus.org/placement',
    'https://www.kitandkimtechnicalcampus.org/public/images/PDF/MandatoryDisclosure.pdf', null,
    'https://www.premiervein.com/contact-us/', 'pending', 'https://www.kitandkimtechnicalcampus.org/', now()
  ),
(
    619, 'https://mce-madurai.ac.in/',
    'https://mce-madurai.ac.in/#', 'https://mce-madurai.ac.in/#',
    'https://mce-madurai.ac.in/wp-content/uploads/2025/07/MCE-MD-Faculty.pdf', 'https://mce-madurai.ac.in/wp-content/uploads/2026/04/MANGAYARKARASI-COLLEGE-OF-ENGINEERING20260220-1-1.pdf',
    'https://mce-madurai.ac.in/contact/', 'pending', 'https://mce-madurai.ac.in/', now()
  ),
(
    623, 'https://christianengineering.in/',
    'https://christianengineering.in/#', 'https://christianengineering.in/#',
    'https://christianengineering.in/aicte-approval/', 'https://christianengineering.in/#',
    'https://christianengineering.in/contact/', 'pending', 'https://christianengineering.in/', now()
  ),
(
    625, 'https://nprcolleges.org/engineering/',
    'http://nprcolleges.org/admission/', 'https://nprcolleges.org/engineering/placement/',
    'https://nprcolleges.org/engineering/mandatory-disclosure/', 'https://nprcolleges.org/engineering/national-institute-ranking-framework/',
    'https://nprcolleges.org/engineering/contact-us/', 'pending', 'https://nprcolleges.org/engineering/', now()
  ),
(
    626, 'http://www.srmmcet.edu.in/',
    'javascript:void(0)', 'http://www.srmmcet.edu.in/placements',
    'http://www.srmmcet.edu.in/mandatory-disclosure', null,
    'http://www.srmmcet.edu.in/contact-us', 'pending', 'http://www.srmmcet.edu.in/', now()
  ),
(
    627, 'https://www.pvpveerammal.com/',
    'http://www.pvpveerammal.com/apply', 'http://www.pvpveerammal.com/placement',
    null, null,
    'http://www.pvpveerammal.com/contact', 'pending', 'https://www.pvpveerammal.com/', now()
  ),
(
    628, 'https://www.rvsetgidgl.ac.in/',
    'https://www.rvsetgidgl.ac.in/admission-cell.php', 'https://www.rvsetgidgl.ac.in/placement-cell.php',
    'https://www.rvsetgidgl.ac.in/assets/pdf/mandatory_disclosure.pdf', 'https://www.rvsetgidgl.ac.in/assets/pdf/nirf.pdf',
    'https://www.rvsetgidgl.ac.in/contact-us.php', 'pending', 'https://www.rvsetgidgl.ac.in/', now()
  ),
(
    630, 'https://www.nscet.org/',
    'https://www.nscet.org/admission/#overview', 'https://www.nscet.org/placement/',
    'https://www.nscet.org/aff_accr/files/NSCET%20-%20Mandatory%20Disclosure-2026-27.pdf', 'https://www.nscet.org/NIRF/',
    'https://www.nscet.org/contact/', 'pending', 'https://www.nscet.org/', now()
  ),
(
    631, 'http://www.accetedu.in/',
    null, null,
    null, null,
    'https://www.mydomaincontact.com/?domain_name=accetedu.in', 'pending', 'http://www.accetedu.in/', now()
  ),
(
    632, 'https://www.bnec.ac.in/',
    'https://www.bnec.ac.in/admission.html', 'https://www.bnec.ac.in/#',
    'https://www.bnec.ac.in/md.html', null,
    'https://www.bnec.ac.in/pccontact.html', 'pending', 'https://www.bnec.ac.in/', now()
  ),
(
    633, 'https://www.klnce.edu/',
    'https://www.klnce.edu/download/2016%20-%202017/JRF_Application_form.doc', 'https://www.klnce.edu/General/Placement.aspx',
    'https://www.klnce.edu/download/KLNCEMANDATORYDISCLOSURE.pdf', 'https://www.klnce.edu/nirf.html',
    'https://www.klnce.edu/General/ContactUs.aspx', 'pending', 'https://www.klnce.edu/', now()
  ),
(
    634, 'https://www.msec.org.in/',
    'https://enrollonline.co.in/Registration/Apply/MSEC', 'https://www.msec.org.in/placement.php',
    'https://www.msec.org.in/mandatorydisclosure.php', 'https://www.msec.org.in/nirf.php',
    'https://www.msec.org.in/contact.php', 'pending', 'https://www.msec.org.in/', now()
  ),
(
    636, 'https://www.ptrcet.edu.in/',
    'https://www.ptrcet.edu.in/contact/', 'https://www.ptrcet.edu.in/#',
    'https://www.ptrcet.edu.in/wp-content/uploads/2024/05/PTRCET-MANDATORYDISCLOSURE1-3.pdf', null,
    'https://www.ptrcet.edu.in/contact/', 'pending', 'https://www.ptrcet.edu.in/', now()
  ),
(
    637, 'https://www.psyec.edu.in/',
    'https://www.psyec.edu.in/admission', 'https://www.psyec.edu.in/#',
    'https://www.psyec.edu.in/mandatory-disclosure', 'https://www.psyec.edu.in/assets/img/brochures/DCS-NIRF.pdf',
    'https://www.psyec.edu.in/contacts', 'pending', 'https://www.psyec.edu.in/', now()
  ),
(
    638, 'https://rvseng.ac.in/',
    'https://rvseng.ac.in/#', 'https://rvseng.ac.in/placement/',
    'https://rvseng.ac.in/#', 'https://rvseng.ac.in/wp-content/uploads/2025/09/RVSCE-NIRF-OVERALL-REPORT.pdf',
    'https://rvseng.ac.in/#', 'pending', 'https://rvseng.ac.in/', now()
  ),
(
    639, 'https://www.solamalaice.ac.in/',
    'https://docs.google.com/forms/d/e/1FAIpQLSfTiQT6PmabALykv_OX7ofLsFw_ku-mUp9neNEXT66YD59fyg/viewform', null,
    null, null,
    null, 'pending', 'https://www.solamalaice.ac.in/', now()
  ),
(
    640, 'https://www.sacsmec.in/',
    'https://www.sacsmec.in/admission', 'https://www.sacsmec.in/page/placement',
    null, null,
    'https://www.sacsmec.in/page/contact-us', 'pending', 'https://www.sacsmec.in/', now()
  ),
(
    641, 'https://www.smcet.edu.in/',
    'https://www.smcet.edu.in/admission/', 'https://www.smcet.edu.in/placements/',
    null, null,
    'https://www.smcet.edu.in/contact/', 'pending', 'https://www.smcet.edu.in/', now()
  ),
(
    642, 'https://www.syedengg.ac.in/',
    null, 'https://www.syedengg.ac.in/#',
    'https://www.syedengg.ac.in/pdf/MandatoryDisclosure.pdf', 'https://www.syedengg.ac.in/NIRF_details.php',
    'https://www.syedengg.ac.in/contact-us.php', 'pending', 'https://www.syedengg.ac.in/', now()
  ),
(
    645, 'https://www.fmcet.ac.in/',
    null, null,
    null, null,
    null, 'pending', 'https://www.fmcet.ac.in/', now()
  ),
(
    646, 'https://ucetw.ac.in/',
    'https://ucetw.ac.in/admission/', 'https://ucetw.ac.in/placement/',
    'https://ucetw.ac.in/wp-content/uploads/2026/02/Mandatory-Disclosure_28.02.2026.pdf', 'https://ucetw.ac.in/#',
    'https://ucetw.ac.in/contact/', 'pending', 'https://ucetw.ac.in/', now()
  ),
(
    647, 'https://www.vcet.ac.in/',
    'https://www.vcet.ac.in/vcetit/admoa.html', 'https://www.vcet.ac.in/#',
    'https://www.vcet.ac.in/vcetit/abtmd.html', 'https://www.vcet.ac.in/vcetit/inirf.html',
    'https://www.vcet.ac.in/vcetit/abtcon.html', 'pending', 'https://www.vcet.ac.in/', now()
  ),
(
    648, 'https://www.tksct.in/',
    'https://www.tksct.ac.in/admissions', 'https://www.tksct.ac.in/placement',
    'https://www.tksct.ac.in/_files/ugd/db8872_0719ce8a065c4e6980ed897729465341.pdf', 'https://www.tksct.in/#',
    'https://www.tksct.ac.in/contactus', 'pending', 'https://www.tksct.in/', now()
  ),
(
    649, 'https://www.lathamathavan.edu.in/',
    'https://www.lathamathavan.edu.in/uncategorized/admission-policy', 'https://www.lathamathavan.edu.in/lmpc-2/',
    null, 'https://www.lathamathavan.edu.in/lmec-nirf',
    'https://www.lathamathavan.edu.in/#contact-us-home', 'pending', 'https://www.lathamathavan.edu.in/', now()
  )
on conflict (college_id) do update set
  official_website = excluded.official_website,
  admissions_url = coalesce(excluded.admissions_url, public.college_official_links.admissions_url),
  placements_url = coalesce(excluded.placements_url, public.college_official_links.placements_url),
  mandatory_disclosure_url = coalesce(excluded.mandatory_disclosure_url, public.college_official_links.mandatory_disclosure_url),
  nirf_disclosure_url = coalesce(excluded.nirf_disclosure_url, public.college_official_links.nirf_disclosure_url),
  contact_url = coalesce(excluded.contact_url, public.college_official_links.contact_url),
  source_url = excluded.source_url,
  last_verified_at = excluded.last_verified_at,
  updated_at = now();

commit;

-- Source: data/imports/college-contact-candidates.sql

begin;

insert into public.college_contacts (
  college_id, contact_type, contact_name,
  email, phone, is_primary, created_at
)
select candidate.*
from (values
(
    179, 'official', 'Official contact',
    'info@aalimec.ac.in', '0123456789', true, now()
  ),
(
    180, 'official', 'Official contact',
    'onlinegrievance@jec.ac.in', null, true, now()
  ),
(
    181, 'official', 'Official contact',
    'info@jitcollege.edu.in', '+919965426274', true, now()
  ),
(
    184, 'official', 'Official contact',
    'principal@rmkec.ac.in', null, true, now()
  ),
(
    185, 'official', 'Official contact',
    'saec@saec.ac.in', '(044) 2680 1999', true, now()
  ),
(
    187, 'official', 'Official contact',
    'principal@sriventech.ac.in', '+914427198105', true, now()
  ),
(
    188, 'official', 'Official contact',
    null, '++917358701999', true, now()
  ),
(
    191, 'official', 'Official contact',
    null, '+91-7358020151', true, now()
  ),
(
    193, 'official', 'Official contact',
    null, '044-24991436', true, now()
  ),
(
    195, 'official', 'Official contact',
    'info@jnn.edu.in', '98842 82631', true, now()
  ),
(
    196, 'official', 'Official contact',
    'principal@spcet.ac.in', '+919884150815', true, now()
  ),
(
    202, 'official', 'Official contact',
    'info@amsarch.ac.in', '04426842333', true, now()
  ),
(
    205, 'official', 'Official contact',
    'office@jeppiaarinstitute.org', '+914427159000', true, now()
  ),
(
    208, 'official', 'Official contact',
    'mnmjsa@gmail.com', '7200106401', true, now()
  ),
(
    212, 'official', 'Official contact',
    'admin@caad.ac.in', '+919710930025', true, now()
  ),
(
    213, 'official', 'Official contact',
    'dmiadmission2020@gmail.com', '9445016740', true, now()
  ),
(
    214, 'official', 'Official contact',
    null, '044-7122 4402', true, now()
  ),
(
    216, 'official', 'Official contact',
    null, '+9190438 91272', true, now()
  ),
(
    218, 'official', 'Official contact',
    'studentsaffairs@rgce.edu.in', '+91 9445896496', true, now()
  ),
(
    220, 'official', 'Official contact',
    'admission@saveetha.ac.in', '+91 8939902737', true, now()
  ),
(
    221, 'official', 'Official contact',
    'headadmission@ssiet.in', '73050281557824804015', true, now()
  ),
(
    222, 'official', 'Official contact',
    null, '+919445227325', true, now()
  ),
(
    223, 'official', 'Official contact',
    'acm@svce.ac.in', '+91-44-27152000', true, now()
  ),
(
    225, 'official', 'Official contact',
    'admissions@pbce.co.in', '+919940026861', true, now()
  ),
(
    228, 'official', 'Official contact',
    null, '7810013333', true, now()
  ),
(
    229, 'official', 'Official contact',
    null, '04423741616', true, now()
  ),
(
    232, 'official', 'Official contact',
    'office@adhi.edu.in', '+919003625277', true, now()
  ),
(
    234, 'official', 'Official contact',
    'info@velammaltrust.com', '9087556789', true, now()
  ),
(
    238, 'official', 'Official contact',
    null, '9940004506', true, now()
  ),
(
    239, 'official', 'Official contact',
    'admission@aiht.ac.in', '+918012136666', true, now()
  ),
(
    240, 'official', 'Official contact',
    'helpdesk@eec.srmrmp.edu.in', '18001032535', true, now()
  ),
(
    241, 'official', 'Official contact',
    'dean@jeppiaarcollege.org', '04424502818', true, now()
  ),
(
    242, 'official', 'Official contact',
    null, '7540037999', true, now()
  ),
(
    245, 'official', 'Official contact',
    'principal@kcgcollege.com', '044 28389001', true, now()
  ),
(
    253, 'official', 'Official contact',
    'dscet@yahoo.co.in', '+917094466503', true, now()
  ),
(
    254, 'official', 'Official contact',
    null, '+914422512111', true, now()
  ),
(
    255, 'official', 'Official contact',
    'admin@stjoseph.ac.in', '+918148454316', true, now()
  ),
(
    262, 'official', 'Official contact',
    null, '9894657971', true, now()
  ),
(
    264, 'official', 'Official contact',
    'principal@dce.edu.in', '+918939873901', true, now()
  ),
(
    268, 'official', 'Official contact',
    'info@madhaengineeringcollege.com', '9790857567', true, now()
  ),
(
    269, 'official', 'Official contact',
    null, '9360428683', true, now()
  ),
(
    270, 'official', 'Official contact',
    'info@svct.edu.in', '04467177779', true, now()
  ),
(
    273, 'official', 'Official contact',
    'onlinegrievancell@sakthiec.edu.in', '044-26340250', true, now()
  ),
(
    274, 'official', 'Official contact',
    null, '+914422512111', true, now()
  ),
(
    275, 'official', 'Official contact',
    null, '+919113989352', true, now()
  ),
(
    276, 'official', 'Official contact',
    'vrscet@yahoo.com', null, true, now()
  ),
(
    277, 'official', 'Official contact',
    'srmvec@srmvalliammai.ac.in', '044 27454784', true, now()
  ),
(
    278, 'official', 'Official contact',
    'amcet2002@gmail.com', '+919789745649', true, now()
  ),
(
    281, 'official', 'Official contact',
    'principal.skec@gmail.com', '+918110861000', true, now()
  ),
(
    282, 'official', 'Official contact',
    'admin@escet.in', '+919486722474', true, now()
  ),
(
    285, 'official', 'Official contact',
    'mail@ritchennai.edu.in', '8925977445', true, now()
  ),
(
    287, 'official', 'Official contact',
    'arec.svet@gmail.com', null, true, now()
  ),
(
    288, 'official', 'Official contact',
    'principal@rrase.org', '+919363304040', true, now()
  ),
(
    290, 'official', 'Official contact',
    'aktengg@yahoo.in', null, true, now()
  ),
(
    291, 'official', 'Official contact',
    'prince@princedrkvasudevan.com', null, true, now()
  ),
(
    296, 'official', 'Official contact',
    'admin@peri.education', null, true, now()
  ),
(
    297, 'official', 'Official contact',
    'admission@apce.in', '+91-4173-242584', true, now()
  ),
(
    298, 'official', 'Official contact',
    'admin@amace.edu.in', '+917550014030', true, now()
  ),
(
    302, 'official', 'Official contact',
    'mceadmission2023@gmail.com', '+91 8925977077', true, now()
  ),
(
    309, 'official', 'Official contact',
    'thirumalaiengg1999@yahoo.co.in', '+918754681968', true, now()
  ),
(
    311, 'official', 'Official contact',
    'principaloffice@bec.ac.in', '+918939690965', true, now()
  ),
(
    314, 'official', 'Official contact',
    'annamalaiarcoe@gmail.com', '+914173290712', true, now()
  ),
(
    315, 'official', 'Official contact',
    'podhigaitech@gmail.com', '+914179292228', true, now()
  ),
(
    316, 'official', 'Official contact',
    'info@srikrishnacollege.co.in', '+91 99443 36600', true, now()
  ),
(
    318, 'official', 'Official contact',
    'papni.edu@gmail.com', '+919363631530', true, now()
  ),
(
    2, 'official', 'Official contact',
    'actechhelpdesk@gmail.com', null, true, now()
  ),
(
    323, 'official', 'Official contact',
    'principal.citoffice@cit.edu.in', '94868 37757', true, now()
  ),
(
    327, 'official', 'Official contact',
    'info@nsn.ac.in', '+919952455117', true, now()
  ),
(
    329, 'official', 'Official contact',
    null, '+91 844 84 48909', true, now()
  ),
(
    332, 'official', 'Official contact',
    'principal@ganeshenggcollege.org', '+910427-2211212', true, now()
  ),
(
    335, 'official', 'Official contact',
    'ksa@kongu.ac.in', '04294 - 226567', true, now()
  ),
(
    336, 'official', 'Official contact',
    'office@dgct.ac.in', '+919500000651', true, now()
  ),
(
    337, 'official', 'Official contact',
    'info@shreesathyam.edu.in', '04283244080', true, now()
  ),
(
    342, 'official', 'Official contact',
    'principal@pietech.edu.in', '+91 8438940273', true, now()
  ),
(
    343, 'official', 'Official contact',
    'apcthennilai@gmail.com', '8003888090', true, now()
  ),
(
    346, 'official', 'Official contact',
    'admissions@scsa.ac.in', null, true, now()
  ),
(
    347, 'official', 'Official contact',
    'soaciet@gmail.com', null, true, now()
  ),
(
    349, 'official', 'Official contact',
    'arjuncollegeoftechnology@yahoo.com', '+919500061500', true, now()
  ),
(
    353, 'official', 'Official contact',
    'barch@hindusthan.net', null, true, now()
  ),
(
    355, 'official', 'Official contact',
    'principal@psgitech.ac.in', '04222233555', true, now()
  ),
(
    362, 'official', 'Official contact',
    null, '+81112522552', true, now()
  ),
(
    363, 'official', 'Official contact',
    null, '94422 26737', true, now()
  ),
(
    370, 'official', 'Official contact',
    'info@scteng.co.in', '+919360053352', true, now()
  ),
(
    372, 'official', 'Official contact',
    'principal@vcew.ac.in', null, true, now()
  ),
(
    376, 'official', 'Official contact',
    'info@gct.org.in', null, true, now()
  ),
(
    379, 'official', 'Official contact',
    'info@paavai.edu.in', null, true, now()
  ),
(
    380, 'official', 'Official contact',
    null, '9345002630', true, now()
  ),
(
    383, 'official', 'Official contact',
    'info@excelcolleges.com', '+919965523999', true, now()
  ),
(
    388, 'official', 'Official contact',
    'principal@jit.net.in', '+91 9087666100', true, now()
  ),
(
    393, 'official', 'Official contact',
    'engg@jkkn.ac.in', '+919345855001', true, now()
  ),
(
    394, 'official', 'Official contact',
    'info@aecsalem.edu.in', '+919786911333', true, now()
  ),
(
    395, 'official', 'Official contact',
    'contact@ckec.ac.in', '+919445008362', true, now()
  ),
(
    396, 'official', 'Official contact',
    'principal@jayshriram.edu.in', '+919047098310', true, now()
  ),
(
    397, 'official', 'Official contact',
    'Alameeneng@gmail.com', '9842022458', true, now()
  ),
(
    398, 'official', 'Official contact',
    null, '+919600541414', true, now()
  ),
(
    403, 'official', 'Official contact',
    null, '7382812345', true, now()
  ),
(
    404, 'official', 'Official contact',
    'info@excelcolleges.com', '9965523999', true, now()
  ),
(
    405, 'official', 'Official contact',
    'ceo@sreesakthi.edu.in', '9244504444', true, now()
  ),
(
    407, 'official', 'Official contact',
    null, '+91 4295 226000', true, now()
  ),
(
    408, 'official', 'Official contact',
    'admin@kingsteruni.edu', null, true, now()
  ),
(
    409, 'official', 'Official contact',
    'principal@csice.edu.in', null, true, now()
  ),
(
    412, 'official', 'Official contact',
    'info@hindusthan.net', '+91 422 - 4440555', true, now()
  ),
(
    414, 'official', 'Official contact',
    'info@kce.ac.in', '914222619005', true, now()
  ),
(
    416, 'official', 'Official contact',
    'info@kct.ac.in', '04222661100', true, now()
  ),
(
    417, 'official', 'Official contact',
    'mpnmjec@mpnmjec.ac.in', '9223372036854775807', true, now()
  ),
(
    419, 'official', 'Official contact',
    'info@pcet.ac.in', '+91 94437 92222', true, now()
  ),
(
    421, 'official', 'Official contact',
    'principal@skcet.ac.in', '0422-267 8001', true, now()
  ),
(
    423, 'official', 'Official contact',
    'info@tnce.ac.in', '+919345483338', true, now()
  ),
(
    424, 'official', 'Official contact',
    'info@skct.edu.in', '04222984567', true, now()
  ),
(
    425, 'official', 'Official contact',
    null, '04242244202', true, now()
  ),
(
    429, 'official', 'Official contact',
    'director@tnsa.ac.in', null, true, now()
  ),
(
    431, 'official', 'Official contact',
    'principalcet@rvsgroup.com', '+91 8778128060', true, now()
  ),
(
    435, 'official', 'Official contact',
    null, '+91 82203 33850', true, now()
  ),
(
    437, 'official', 'Official contact',
    'reccbe@reccbe.ac.in', '0422 2619100', true, now()
  ),
(
    439, 'official', 'Official contact',
    null, '+91 9715260118', true, now()
  ),
(
    441, 'official', 'Official contact',
    null, '9500149092', true, now()
  ),
(
    442, 'official', 'Official contact',
    null, '+917373700933', true, now()
  ),
(
    445, 'official', 'Official contact',
    'admissions@surya.ac.in', '+91 99766 96222', true, now()
  ),
(
    446, 'official', 'Official contact',
    'info@easatech.com', '+917550081295', true, now()
  ),
(
    447, 'official', 'Official contact',
    'kitcbe@gmail.com', '9965590056', true, now()
  ),
(
    449, 'official', 'Official contact',
    'info@nandhatech.org', '+917373714477', true, now()
  ),
(
    450, 'official', 'Official contact',
    null, '+91 90477 77977', true, now()
  ),
(
    452, 'official', 'Official contact',
    'principal@jkkmct.edu.in', null, true, now()
  ),
(
    455, 'official', 'Official contact',
    'info@jit.ac.in', null, true, now()
  ),
(
    456, 'official', 'Official contact',
    'info@acetcbe.edu.in', null, true, now()
  ),
(
    457, 'official', 'Official contact',
    'admission@kpriet.ac.in', '+917548888444', true, now()
  ),
(
    460, 'official', 'Official contact',
    'admissions@jct.ac.in', '+9193614888801', true, now()
  ),
(
    461, 'official', 'Official contact',
    'coimbatore@swehg.com', '+919944911933', true, now()
  ),
(
    466, 'official', 'Official contact',
    'info@aubit.edu.in', null, true, now()
  ),
(
    467, 'official', 'Official contact',
    'ucea@auucea.edu.in', '04329-2917278', true, now()
  ),
(
    470, 'official', 'Official contact',
    'deanpktau@gmail.com', '04373 -293301', true, now()
  ),
(
    471, 'official', 'Official contact',
    null, '+919940901224', true, now()
  ),
(
    472, 'official', 'Official contact',
    null, '+21236547898', true, now()
  ),
(
    476, 'official', 'Official contact',
    'admin@sriramakrishna.ac.in', '+919585544688', true, now()
  ),
(
    477, 'official', 'Official contact',
    'kskduraimurugan2211@gmail.com', '+91 9942648026', true, now()
  ),
(
    485, 'official', 'Official contact',
    'admissions@krct.ac.in', '+919095013777', true, now()
  ),
(
    486, 'official', 'Official contact',
    null, '+917373765117', true, now()
  ),
(
    488, 'official', 'Official contact',
    'contact@oasys.edu.in', null, true, now()
  ),
(
    490, 'official', 'Official contact',
    null, '+914312690505', true, now()
  ),
(
    492, 'official', 'Official contact',
    'helpdesk@trp.srmtrichy.edu.in', '1800 202 2535', true, now()
  ),
(
    495, 'official', 'Official contact',
    'principal@aamec.edu.in', '+9104374232516', true, now()
  ),
(
    497, 'official', 'Official contact',
    'dsec.office@dsengg.ac.in', '7094433186', true, now()
  ),
(
    498, 'official', 'Official contact',
    null, '9976888999', true, now()
  ),
(
    502, 'official', 'Official contact',
    'secretary@mamce.org', '+917305092313', true, now()
  ),
(
    503, 'official', 'Official contact',
    'mechanical.hod@miet.edu', '0431-2660302', true, now()
  ),
(
    504, 'official', 'Official contact',
    'principal@mookambigai.ac.in', '04339 262 141', true, now()
  ),
(
    505, 'official', 'Official contact',
    null, '04312403651', true, now()
  ),
(
    508, 'official', 'Official contact',
    'office@roeverengg.edu.in', '9750970157', true, now()
  ),
(
    510, 'official', 'Official contact',
    'admissions@trichyengg.ac.in', '+91-6385429749', true, now()
  ),
(
    512, 'official', 'Official contact',
    'mail.nnce@gmail.com', '+91 7867086702', true, now()
  ),
(
    514, 'official', 'Official contact',
    null, '0123456789', true, now()
  ),
(
    516, 'official', 'Official contact',
    'info@krce.ac.in', '+91-9842991377', true, now()
  ),
(
    520, 'official', 'Official contact',
    'admissioncell@mrkit.edu.in', '9487691969', true, now()
  ),
(
    521, 'official', 'Official contact',
    'info@shivani.ac.in', '+919750965056', true, now()
  ),
(
    523, 'official', 'Official contact',
    'placement@mtcet.in', null, true, now()
  ),
(
    525, 'official', 'Official contact',
    'info@annaiengg.org', '+918807053849', true, now()
  ),
(
    527, 'official', 'Official contact',
    'sribharathienggcollege@gmail.com', null, true, now()
  ),
(
    533, 'official', 'Official contact',
    'antiragging@kingsengg.edu.in', '+919443900509', true, now()
  ),
(
    535, 'official', 'Official contact',
    'info@shanmuganathanengg.in', '7373731541', true, now()
  ),
(
    536, 'official', 'Official contact',
    'contact@sec.ac.in', '+91 98434 90905', true, now()
  ),
(
    537, 'official', 'Official contact',
    'info@mnsk.ac.in', '9344543658', true, now()
  ),
(
    540, 'official', 'Official contact',
    'deanucen@gmail.com', '04652-260511', true, now()
  ),
(
    542, 'official', 'Official contact',
    null, '+91 93608 04669', true, now()
  ),
(
    543, 'official', 'Official contact',
    'admin@rcet.org.in', null, true, now()
  ),
(
    544, 'official', 'Official contact',
    'sigmagroup155@gmail.com', '9443370072', true, now()
  ),
(
    545, 'official', 'Official contact',
    null, '+917402707775', true, now()
  ),
(
    552, 'official', 'Official contact',
    'gscet2018@gmail.com', null, true, now()
  ),
(
    554, 'official', 'Official contact',
    'sit@sethu.ac.in', null, true, now()
  ),
(
    558, 'official', 'Official contact',
    null, '90436 40436', true, now()
  ),
(
    559, 'official', 'Official contact',
    'info@grace.edu.in', '+4733378901', true, now()
  ),
(
    562, 'official', 'Official contact',
    'info@holycrossengineeringcollege.com', '+919994226362', true, now()
  ),
(
    567, 'official', 'Official contact',
    'acewomenscollege@gmail.com', '+91 9487181849', true, now()
  ),
(
    570, 'official', 'Official contact',
    'psnits.principal@gmail.com', '+914634279084', true, now()
  ),
(
    571, 'official', 'Official contact',
    null, '9442079540', true, now()
  ),
(
    572, 'official', 'Official contact',
    'info@capeitech.org', '+918903837777', true, now()
  ),
(
    575, 'official', 'Official contact',
    'jayamathacollege@yahoo.com', '9943025304', true, now()
  ),
(
    579, 'official', 'Official contact',
    null, '04635256343', true, now()
  ),
(
    582, 'official', 'Official contact',
    'contact@psr.edu.in', '80125 31321', true, now()
  ),
(
    586, 'official', 'Official contact',
    'pro@scadengineering.ac.in', '+91 4634 261701', true, now()
  ),
(
    591, 'official', 'Official contact',
    'drgupopeengineering@yahoo.com', '04630273933', true, now()
  ),
(
    592, 'official', 'Official contact',
    'contact@ijce.ac.in', '+919444446699', true, now()
  ),
(
    593, 'official', 'Official contact',
    'info@ngce.ac.in', '91940096001091940098', true, now()
  ),
(
    594, 'official', 'Official contact',
    null, '+0123456789', true, now()
  ),
(
    596, 'official', 'Official contact',
    'office@einsteincollege.ac.in', '+91 462 2487 111', true, now()
  ),
(
    601, 'official', 'Official contact',
    'principal@psnec.ac.in', '(04634) 279078', true, now()
  ),
(
    602, 'official', 'Official contact',
    null, '+918056420728', true, now()
  ),
(
    604, 'official', 'Official contact',
    null, '8012520500', true, now()
  ),
(
    605, 'official', 'Official contact',
    'contact@psrr.edu.in', '80125 31325', true, now()
  ),
(
    614, 'official', 'Official contact',
    null, '9952816092', true, now()
  ),
(
    615, 'official', 'Official contact',
    null, '+917052101786', true, now()
  ),
(
    617, 'official', 'Official contact',
    'vaigaioffice@gmail.com', null, true, now()
  ),
(
    618, 'official', 'Official contact',
    'kitandkimtechnicalcampus@yahoo.com', '8903632366', true, now()
  ),
(
    619, 'official', 'Official contact',
    'mangai.enggcoll@gmail.com', '+910452-2668635', true, now()
  ),
(
    623, 'official', 'Official contact',
    'principaloffice@christianengineering.in', '+919524124125', true, now()
  ),
(
    625, 'official', 'Official contact',
    'nprcetoffice@nprcolleges.org', '8973555559', true, now()
  ),
(
    626, 'official', 'Official contact',
    'admissions@srmmcet.edu.in', '+917845775188', true, now()
  ),
(
    628, 'official', 'Official contact',
    'directorrvsetgi@rvsgroup.com', '+9180563444348056744', true, now()
  ),
(
    634, 'official', 'Official contact',
    null, '9940004506', true, now()
  ),
(
    636, 'official', 'Official contact',
    'officeptrcet@gmail.com', '+04526915079', true, now()
  ),
(
    637, 'official', 'Official contact',
    null, '+917373002628', true, now()
  ),
(
    638, 'official', 'Official contact',
    null, '900654815', true, now()
  ),
(
    640, 'official', 'Official contact',
    'sacsmec@yahoo.com', '+91 8300076902', true, now()
  ),
(
    641, 'official', 'Official contact',
    null, '+91 99427 96723', true, now()
  ),
(
    642, 'official', 'Official contact',
    'office@syedengg.ac.in', null, true, now()
  ),
(
    646, 'official', 'Official contact',
    null, '9443799966', true, now()
  ),
(
    647, 'official', 'Official contact',
    null, '+919994994991', true, now()
  ),
(
    648, 'official', 'Official contact',
    'tkscttheni@gmail.com', null, true, now()
  )
) as candidate (
  college_id, contact_type, contact_name,
  email, phone, is_primary, created_at
)
where not exists (
  select 1 from public.college_contacts existing
  where existing.college_id = candidate.college_id
    and coalesce(existing.email, '') = coalesce(candidate.email, '')
    and coalesce(existing.phone, '') = coalesce(candidate.phone, '')
);

commit;

-- Source: data/imports/college-image-candidates.sql

begin;

insert into public.college_images (
  college_id, image_url, image_type, caption,
  display_order, is_active, source_url,
  usage_status, attribution, last_verified_at
)
select candidate.*
from (values
(
    176, 'https://www.aucet.in/home/img/front-img.jpg', 'campus',
    'University College of Engineering, Tindivanam, Melpakkam, Tindivanam, Villupur official campus image', 0, false, 'https://www.aucet.in/',
    'permission_required', 'Official college website', now()
  ),
(
    179, 'https://aalimec.ac.in/wp-content/uploads/2024/07/lightlogo-1.png', 'logo',
    'Aalim Muhammed Salegh College of Engineering, Muthapudupet, Avadi IAF, Chennai 600055 official logo', 0, false, 'https://aalimec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    179, 'https://aalimec.ac.in/wp-content/uploads/2024/07/lightlogo-2.png', 'campus',
    'Aalim Muhammed Salegh College of Engineering, Muthapudupet, Avadi IAF, Chennai official campus image', 0, false, 'https://aalimec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    181, 'https://www.jitcollege.edu.in/assets/image/jit-logo.png', 'logo',
    'Jaya Institute of Technology, Kanchipadi Post, Thiruvallur-TiruttaniNH Road, Thiruvall official logo', 0, false, 'https://www.jitcollege.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    182, 'https://prathyusha.edu.in/wp-content/uploads/2024/09/PRATHYUSHA-ENGINEERING-COLLEGE-An-Autonomous-Institution-1.png', 'logo',
    'Prathyusha Engineering college, (Autonomous) Aranvoyalkuppam, Thiruvallur District 602 official logo', 0, false, 'https://prathyusha.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    182, 'https://prathyusha.edu.in/wp-content/uploads/2026/07/Prathyusha-Engineering-College-image.jpg', 'campus',
    'Prathyusha Engineering college, (Autonomous) Aranvoyalkuppam, Thiruvallur Dist official campus image', 0, false, 'https://prathyusha.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    183, 'https://www.rmd.ac.in/images/headerlogo.png', 'logo',
    'R M D Engineering College (Autonomous), Kavaraipettai, Gummidipoondi, Thiruvallur Dist official logo', 0, false, 'https://www.rmd.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    185, 'https://www.saec.ac.in/assets/images/logo.png', 'logo',
    'S A Engineering College (Autonomous), Thiruverkadu, Chennai 600077 official logo', 0, false, 'https://www.saec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    185, 'https://saec.ac.in/assets/images/resources/quote-img.jpg', 'campus',
    'S A Engineering College (Autonomous), Thiruverkadu, Chennai 600077 official campus image', 0, false, 'https://www.saec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    187, 'https://www.sriventech.ac.in/new/images/logo1.png', 'logo',
    'Sri Venkateswara College of Engineering and Technology, Thirupachur, Thiruvallur Distr official logo', 0, false, 'https://www.sriventech.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    191, 'https://www.velhightech.com/assets/images/logo.png', 'logo',
    'Vel Tech High Tech Dr. Rangarajan Dr.Sakunthala Engineering College (Autonomous), Avad official logo', 0, false, 'https://www.velhightech.com/',
    'permission_required', 'Official college website', now()
  ),
(
    192, 'https://www.gojaneducation.tech/gsbt-logo.png', 'logo',
    'Gojan School of Business and Technology, Alamathi, Chennai 600062 official logo', 0, false, 'https://www.gojaneducation.tech/',
    'permission_required', 'Official college website', now()
  ),
(
    195, 'https://www.jnn.edu.in/wp-content/uploads/2025/04/JNNIE-Autonomous-Logo-1.svg', 'logo',
    'J.N.N Institute of Engineering(Autonomous), Ushaa Garden, Kannigaipair Village, Uthuko official logo', 0, false, 'https://www.jnn.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    195, 'https://www.jnn.edu.in/wp-content/uploads/2025/09/OG_image.png', 'campus',
    'J.N.N Institute of Engineering(Autonomous), Ushaa Garden, Kannigaipair Village official campus image', 0, false, 'https://www.jnn.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    196, 'https://www.spcet.ac.in/assets/img/spcet_logo.png', 'logo',
    'St. Peters College of Engineering and Technology, College Road, Avadi, Chennai official logo', 0, false, 'https://www.spcet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    197, 'https://www.rmkcet.ac.in/new_design_images/logo-new-nav.svg', 'logo',
    'R M K College of Engineering and Technology (Autonomous), Puduvoyal, Gummidipoondi Tal official logo', 0, false, 'https://www.rmkcet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    198, 'https://i0.wp.com/jayaarchitecture.com/wp-content/uploads/2021/09/JSA-LOGO-WEB_f.png?fit=259%2C70&amp;ssl=1', 'logo',
    'Jaya School of Architecture, Poonamallee By-Pass Road, Poonamallee, Chennai 600 056 official logo', 0, false, 'https://jayaarchitecture.com/',
    'permission_required', 'Official college website', now()
  ),
(
    202, 'https://amsarch.ac.in/wp-content/uploads/2023/08/AMS-ARCH-LOGO-scaled.png', 'logo',
    'Aalim Muhammed Salegh Academy of Architecture, Muthapudupet, Avadi IAF, Chennai official logo', 0, false, 'https://amsarch.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    202, 'https://amsarch.ac.in/wp-content/uploads/2025/07/Aalim-Muhammed-Salegh-Academy-of-Architecture-Chennai-Featured.jpg', 'campus',
    'Aalim Muhammed Salegh Academy of Architecture, Muthapudupet, Avadi IAF, Chenna official campus image', 0, false, 'https://amsarch.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    208, 'https://mnmjsa.ac.in/wp-content/uploads/2026/05/banner-image.png', 'logo',
    'Thoraipakkam, Chengalpattu 600096 official logo', 0, false, 'https://mnmjsa.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    212, 'https://www.caad.ac.in/assets/images/caad_logo_big.jpg', 'logo',
    'Chennai-Thirupathi Highway, Near Periyapalayam Amman Temple, Chennai 601102 official logo', 0, false, 'https://www.caad.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    213, 'https://dmice.ac.in/wp-content/uploads/2026/06/DMI_logo1.png', 'logo',
    'D M I College of Engineering, Palanchoor, Nazrethpet, Chennai 602103 official logo', 0, false, 'https://dmice.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    214, 'https://www.kingsedu.ac.in/thumbnail.png', 'campus',
    'Kings Engineering College, Sriperumpudur Taluk, Kancheepuram District official campus image', 0, false, 'https://www.kingsedu.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    216, 'https://www.panimalar.ac.in/assets/images/clients/accenture.jpg', 'logo',
    'Panimalar Engineering College (Autonomous), Nazarethpet, Poonamallee, Chennai 602123 official logo', 0, false, 'https://www.panimalar.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    217, 'http://www.rajalakshmi.org/image/logo2.png', 'logo',
    'Rajalakshmi Engineering College (Autonomous), Thandalam, Sriperumpudur Taluk, Kancheep official logo', 0, false, 'http://www.rajalakshmi.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    217, 'http://www.rajalakshmi.org/engineering-admissions-2017/image/site_desc.jpg', 'campus',
    'Rajalakshmi Engineering College (Autonomous), Thandalam, Sriperumpudur Taluk, official campus image', 0, false, 'http://www.rajalakshmi.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    218, 'https://rgei.ac.in/assets/img/white-logo.png', 'logo',
    'Rajiv Gandhi College of Engineering, Nemili, Sriperumpudur Taluk, Kancheepuram Distric official logo', 0, false, 'https://rgei.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    220, 'https://saveetha.ac.in/wp-content/uploads/2024/03/sec-logo-01as.png', 'logo',
    'Saveetha Engineering College (Autonomous), Thandalam, Sriperumpudur Taluk, Kancheepura official logo', 0, false, 'https://saveetha.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    221, 'https://sasthainstitutions.in/wp-content/uploads/2021/06/courses-offered-1.jpg', 'campus',
    'Sree Sastha Institute of Engineering and Technology, Chembarambakkam, Chennai official campus image', 0, false, 'https://sasthainstitutions.in/',
    'permission_required', 'Official college website', now()
  ),
(
    223, 'https://www.svce.ac.in/wp-content/uploads/2020/03/svce_logo.jpg', 'logo',
    'Sri Venkateswara College of Engineering (Autonomous), Post Bag No.1, Chennai-Bengaluru official logo', 0, false, 'https://www.svce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    228, 'https://alphagroup.edu/engineering/images/logo.svg', 'logo',
    'Alpha College of Engineering, No.34, Udayavar Koil Street, Poonamallee, Thirumazhisai, official logo', 0, false, 'https://alphagroup.edu/engineering/',
    'permission_required', 'Official college website', now()
  ),
(
    232, 'https://www.adhi.edu.in/ext_files/images/logo2.png', 'logo',
    'Adhi College of Engineering and Technology, Pazhayaseevaram, Madura Sankarapuram Villa official logo', 0, false, 'https://www.adhi.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    232, 'https://www.adhi.edu.in/ext_files/images/index-slide-1.jpeg', 'campus',
    'Adhi College of Engineering and Technology, Pazhayaseevaram, Madura Sankarapur official campus image', 0, false, 'https://www.adhi.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    235, 'https://grt.edu.in/wp-content/uploads/2025/01/grt_footer.jpg', 'logo',
    'G R T Institute of Engineering and Technology, GRT Mahalakshmi Nagar, Chennai-Tirupath official logo', 0, false, 'https://grt.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    235, 'https://grt.edu.in/wp-content/themes/grt/images/icons/og-image.jpg', 'campus',
    'G R T Institute of Engineering and Technology, GRT Mahalakshmi Nagar, Chennai- official campus image', 0, false, 'https://grt.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    236, 'https://tjsec.in/wp-content/uploads/2018/08/apply-logo.png', 'logo',
    'T J S Engineering College, Peruvoyal, Near Kavaraipettai, Gummidipoondi Taluk, Thiruva official logo', 0, false, 'https://tjsec.in/',
    'permission_required', 'Official college website', now()
  ),
(
    238, 'https://www.msajce-edu.in/images/logo-wide3.png', 'logo',
    'Mohammed Sathak A J College of Engineering, Old Mahabalipuram Road (OMR), Egattur, Che official logo', 0, false, 'https://www.msajce-edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    239, 'http://www.aiht.ac.in/vendor/images/logo.png', 'logo',
    'Anand Institute of Higher Technology, Old Mahabalipuram Road (OMR), Kazhipattur, Cheng official logo', 0, false, 'http://www.aiht.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    240, 'https://srmeaswari.ac.in/wp-content/uploads/2022/06/eec-logo-finalized-1024x344.png', 'logo',
    'Easwari Engineering College (Autonomous), Ramapuram, Chennai 600089 official logo', 0, false, 'https://srmeaswari.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    240, 'https://srmeaswari.ac.in/wp-content/uploads/2022/09/r-1-1-2.png', 'campus',
    'Easwari Engineering College (Autonomous), Ramapuram, Chennai 600089 official campus image', 0, false, 'https://srmeaswari.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    241, 'http://jeppiaarcollege.org/jeppiaar/wp-content/uploads/2018/02/Jeppiaar-Logo-01.png', 'logo',
    'Jeppiaar Engineering College, Old Mahabalipuram Road (OMR), Chennai official logo', 0, false, 'https://jeppiaarcollege.org/jeppiaar/',
    'permission_required', 'Official college website', now()
  ),
(
    242, 'https://www.jerusalemengg.ac.in/images/actual/Recruiter%20(1).png', 'logo',
    'Jerusalem College of Engineering (Autonomous), Narayanapuram, Pallikaranai, Chennai 60 official logo', 0, false, 'https://www.jerusalemengg.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    243, 'https://msec.edu.in/assets/img/mseclogo.png', 'logo',
    'Meenakshi Sundararajan Engineering College, Kodambakkam, Chennai 600024 official logo', 0, false, 'https://msec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    243, 'https://www.msec.edu.in/assets/img/campus.jpeg', 'campus',
    'Meenakshi Sundararajan Engineering College, Kodambakkam, Chennai 600024 official campus image', 0, false, 'https://msec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    244, 'https://www.mnmjec.ac.in/img/home/new-logo.png', 'logo',
    'MisrimalNavajeeMunoth Jain Engineering College, Rajiv Gandhi Salai (OMR), Thorappakkam official logo', 0, false, 'https://www.mnmjec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    249, 'https://stjosephs.ac.in/assets/images/Engg%20Logo1.png', 'logo',
    'St. Joseph’s College of Engineering (Autonomous), Old Mahabalipuram Road (OMR), Chenna official logo', 0, false, 'https://stjosephs.ac.in/index.html',
    'permission_required', 'Official college website', now()
  ),
(
    252, 'https://www.cipet.gov.in/images/top/cipet-logo-new1.jpg', 'logo',
    'of Plastics Engineering and Technology) (CIPET), Guindy, Chennai 600032 official logo', 0, false, 'https://www.cipet.gov.in/',
    'permission_required', 'Official college website', now()
  ),
(
    253, 'https://www.dscet.ac.in/assets/images/logo.png', 'logo',
    'Dhanalakshmi Srinivasan College of Engineering and Technology, East Coast Road, Poonje official logo', 0, false, 'https://www.dscet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    254, 'https://sairamit.edu.in/wp-content/uploads/2024/07/sairam-it-logo.png', 'logo',
    'Sri Sai Ram Institute of Technology (Autonomous), West Tambaram, Chennai 600044 official logo', 0, false, 'https://sairamit.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    255, 'https://www.stjoseph.ac.in/assets/images/Event%20/June%202025/webnewlogo1.png', 'logo',
    'St. Joseph College of Engineering, Trinity Campus, Nemili, Sriperumpudur Taluk, Kanche official logo', 0, false, 'https://www.stjoseph.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    255, 'https://stjoseph.ac.in/assets/images/events/june-2025/webnewlogo1.png', 'campus',
    'St. Joseph College of Engineering, Trinity Campus, Nemili, Sriperumpudur Taluk official campus image', 0, false, 'https://www.stjoseph.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    262, 'https://apec.edu.in/_next/image?url=https%3A%2F%2Fassets.super.so%2F47fa140c-5512-4ac6-a02b-6305f7e083a9%2Fuploads%2Flogo%2F9981c535-9e3c-4f3b-a0cb-ac2b2b5d329e.png&amp;w=384&amp;q=75', 'logo',
    'Adhiparasakthi Engineering College, Melmaruvathur, Chengalpattu District official logo', 0, false, 'https://apec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    262, 'https://images.spr.so/cdn-cgi/imagedelivery/j42No7y-dcokJuNgXeA0ig/40b7d78f-087c-4435-8716-61ab7b5bfef0/Ad_(1)/public', 'campus',
    'Adhiparasakthi Engineering College, Melmaruvathur, Chengalpattu District official campus image', 0, false, 'https://apec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    264, 'https://dce.edu.in/wp-content/uploads/2026/01/DCE-logo.png', 'logo',
    'Dhanalakshmi College of Engineering, Manimangalam, Chennai 601301 official logo', 0, false, 'https://dce.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    264, 'https://dce.edu.in/wp-content/uploads/2026/03/DCE-Social-Share-1.jpg', 'campus',
    'Dhanalakshmi College of Engineering, Manimangalam, Chennai 601301 official campus image', 0, false, 'https://dce.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    265, 'https://www.gkmcet.net.in/images/GKMheader.png', 'logo',
    'G K M College of Engineering and Technology, Alappakkam-Mappedu Road, Chennai 600063 official logo', 0, false, 'https://www.gkmcet.net.in/',
    'permission_required', 'Official college website', now()
  ),
(
    266, 'https://ifet.ac.in/wp-content/uploads/2024/06/logo__five.svg', 'logo',
    'I F E T College of Engineering (Autonomous), Gangarampalayam, Villupuram District 6051 official logo', 0, false, 'https://ifet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    268, 'https://www.madhaengineeringcollege.com/wp-content/themes/madha/assests/images/footer-logo.png', 'logo',
    'Madha Engineering College, Kundrathur, Chennai 600069 official logo', 0, false, 'https://www.madhaengineeringcollege.com/',
    'permission_required', 'Official college website', now()
  ),
(
    269, 'https://mailamengg.ac.in/wp-content/uploads/2023/12/mailam-logo-2.png', 'logo',
    'Mailam Engineering College, Mailam, Villupuram District 604304 official logo', 0, false, 'https://mailamengg.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    270, 'https://www.svct.edu.in/_next/static/media/logo.cafd52e7.png', 'logo',
    'Sri Venkateswaraa College of Technology, Sirukulathur, Vadakkal Village, Pondur Post, official logo', 0, false, 'https://www.svct.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    270, 'https://svct.edu.in/og-image.png', 'campus',
    'Sri Venkateswaraa College of Technology, Sirukulathur, Vadakkal Village, Pondu official campus image', 0, false, 'https://www.svct.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    271, 'https://psvpec.in/wp-content/uploads/2025/04/Prince-Logo-new.png', 'logo',
    'Prince Shri Venkateshwara Padmavathy Engineering College(Autonomous), Ponmar, Chennai official logo', 0, false, 'https://psvpec.in/',
    'permission_required', 'Official college website', now()
  ),
(
    271, 'https://psvpec.in/wp-content/uploads/2026/03/IMG_1410-scaled.jpg', 'campus',
    'Prince Shri Venkateshwara Padmavathy Engineering College(Autonomous), Ponmar, official campus image', 0, false, 'https://psvpec.in/',
    'permission_required', 'Official college website', now()
  ),
(
    273, 'https://www.sakthiec.edu.in/Assets/Images/jayagc_logo.png', 'logo',
    'Jaya Sakthi Engineering College, Thirunindravur, Chennai 602024 official logo', 0, false, 'https://www.sakthiec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    274, 'https://sairam.edu.in/wp-content/uploads/2023/10/sairam-sec-logo.png', 'logo',
    'Sri Sai Ram Enginering College (Autonomous), West Tambaram, Chennai official logo', 0, false, 'https://sairam.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    275, 'https://tagore-engg.ac.in/images/tagore-logo.png', 'logo',
    'Tagore Engineering College, Rathnamangalam, Vandalur Post, Chennai 600048 official logo', 0, false, 'https://www.tagore-engg.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    276, 'http://vrscet.in/wp-content/uploads/2020/02/College-logo.png', 'logo',
    'V R S College of Engineering and Technology, Arasur, Villupuram District official logo', 0, false, 'http://vrscet.in/',
    'permission_required', 'Official college website', now()
  ),
(
    277, 'https://srmvalliammai.ac.in/wp-content/uploads/2022/06/new-logo1-1.png', 'logo',
    'SRM Valliammai Engineering College (Autonomous), Kattankulathur, Chennai official logo', 0, false, 'https://srmvalliammai.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    278, 'https://www.amcet.co.in/wp-content/uploads/2024/06/amcet_logo_m-1.png', 'logo',
    'Asan Memorial College of Engineering and Technology, Chengalpattu-603 001. official logo', 0, false, 'https://www.amcet.co.in/',
    'permission_required', 'Official college website', now()
  ),
(
    278, 'https://www.amcet.co.in/wp-content/uploads/2024/10/intro-amcet.jpg', 'campus',
    'Asan Memorial College of Engineering and Technology, Chengalpattu-603 001. official campus image', 0, false, 'https://www.amcet.co.in/',
    'permission_required', 'Official college website', now()
  ),
(
    282, 'https://escet.in/img/logo/logo.png', 'logo',
    'E S Engineering College, Chennai Trunk Road, Ayyankoilpattu, Villupuram District 60560 official logo', 0, false, 'https://escet.in/',
    'permission_required', 'Official college website', now()
  ),
(
    288, 'https://rrase.com/wp-content/uploads/2025/02/image-3.png', 'logo',
    'Rrase College of Engineering, Padappai, Kancheepuram 601301 official logo', 0, false, 'https://rrase.com/',
    'permission_required', 'Official college website', now()
  ),
(
    291, 'https://www.princedrkvasudevan.com/image/logo.jpeg', 'campus',
    'Prince Dr. K Vasudevan College of Engineering and Technology, Medavakkam- Mamb official campus image', 0, false, 'https://www.princedrkvasudevan.com/',
    'permission_required', 'Official college website', now()
  ),
(
    293, 'http://rangapoopathi.in/temp/logo.png', 'logo',
    'Sri Rangapoopathi College of Engineering, Alampoondi Village, Gingee, Villupuram Distr official logo', 0, false, 'http://rangapoopathi.in/',
    'permission_required', 'Official college website', now()
  ),
(
    297, 'https://www.apce.in/img/logo.jpg', 'logo',
    'Adhiparasakthi College of Engineering, Kalavai, Ranipet District 632506 official logo', 0, false, 'https://www.apce.in/',
    'permission_required', 'Official college website', now()
  ),
(
    298, 'https://www.amace.edu.in/assets/images/MGI-Logo1.webp', 'logo',
    'Arulmigu Meenakshi Amman College of Engineering, Vadamavandal, Thiruvannamalai Distric official logo', 0, false, 'https://www.amace.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    298, 'https://www.amace.edu.in/assets/images/amace%20web%20logo-01.webp', 'campus',
    'Arulmigu Meenakshi Amman College of Engineering, Vadamavandal, Thiruvannamalai official campus image', 0, false, 'https://www.amace.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    301, 'http://www.gtec.ac.in/images/2023/Gtec_Logo.jpg', 'logo',
    'Ganadipathy Tulsi’s Jain Engineering College, Kaniyambadi, Vellore District official logo', 0, false, 'http://www.gtec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    302, 'https://mce.edu.in/assets/img/aicte.webp', 'logo',
    'Meenakshi College of Engineering, Vembuliamman Koil Street, K K Nagar (West), Chennai official logo', 0, false, 'https://mce.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    305, 'https://skpec.edu.in/wp-content/uploads/2023/08/cropped-WhatsApp-Image-2023-07-04-at-2.48.57-PM-1024x948-1-150x150.webp', 'logo',
    'S K P Engineering College, Thiruvannamalai District 606611 official logo', 0, false, 'https://skpec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    309, 'https://thirumalaiengg.org/wp-content/uploads/2025/08/tec-center-view.jpg', 'campus',
    'Thirumalai Engineering College, Kilambi, Kancheepuram District 631551 official campus image', 0, false, 'https://thirumalaiengg.org/',
    'permission_required', 'Official college website', now()
  ),
(
    310, 'https://www.dynadot.com/tr/mainsite2023/navbar-logo-dark-2023.png', 'logo',
    'Thiruvalluvar College of Engineering and Technology, Vandavasi, Thiruvannamalai Distri official logo', 0, false, 'http://www.tcet.co.in/',
    'permission_required', 'Official college website', now()
  ),
(
    312, 'https://kingston.ac.in/images/logo-all.png', 'logo',
    'Kingston Engineering College, Chithoor Main Road, Christianpet Village, Katpadi Taluk, official logo', 0, false, 'https://kingston.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    313, 'https://getedu.in/assets/git-logo.png', 'logo',
    'Global Institute of Engineering and Technology, Bangalore-Chennai Highway, Melvisharam official logo', 0, false, 'https://www.getedu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    314, 'https://www.annamalaiarengg.com/annamalaiar/uploads/2021/04/logo_new.png', 'logo',
    'Annamalaiar College of Engineering, Modaiyur Village, Polur Taluk, Thiruvannamalai Dis official logo', 0, false, 'https://www.annamalaiarengg.com/',
    'permission_required', 'Official college website', now()
  ),
(
    314, 'https://www.annamalaiarengg.com/annamalaiar/uploads/slider/cache/31a5944890eac1b89e0a276ee2d926e2/banner-2026-1.png', 'campus',
    'Annamalaiar College of Engineering, Modaiyur Village, Polur Taluk, Thiruvannam official campus image', 0, false, 'https://www.annamalaiarengg.com/',
    'permission_required', 'Official college website', now()
  ),
(
    315, 'https://www.podhigaitech.ac.in/img/logo-dark.png', 'logo',
    'Podhigai College of Engineering and Technology, Vinayakapuram, Adiyur Post, Tirupattur official logo', 0, false, 'https://www.podhigaitech.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    318, 'https://papniarch.ac.in/wp-content/uploads/2021/11/Papni-School-of-Architecture-Logo-white-286x85-1.png', 'logo',
    'Papni School of Architecture, 302/1, Keeranallur Village, Sriperumbudhur Taluk, Kanche official logo', 0, false, 'https://papniarch.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    318, 'https://papniarch.ac.in/wp-content/uploads/2022/12/6.jpg', 'campus',
    'Papni School of Architecture, 302/1, Keeranallur Village, Sriperumbudhur Taluk official campus image', 0, false, 'https://papniarch.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    320, 'https://iecw.edu.in/_next/image?url=%2Fimages%2Flogos%2Flogo.png&amp;w=256&amp;q=75', 'logo',
    'Idhaya Engineering College for Women, Chinnasalem, Kallakkurichi District official logo', 0, false, 'https://iecw.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    323, 'https://cit.edu.in/uploads/generalfiles/citlogo260204155727.png', 'logo',
    'Coimbatore Institute of Technology (Autonomous), Civil Aerodrome Post, Coimbatore Dist official logo', 0, false, 'http://cit.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    323, 'http://cit.edu.in/uploads/meta_images/1779172598_cit-fav-logo.png', 'campus',
    'Coimbatore Institute of Technology (Autonomous), Civil Aerodrome Post, Coimbat official campus image', 0, false, 'http://cit.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    324, 'https://www.aurcc.ac.in/favicon.svg', 'campus',
    'Anna University Regional Campus - Coimbatore, Maruthamalai Main Road, Navavoor official campus image', 0, false, 'https://www.aurcc.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    327, 'https://nsn.ac.in/img/logo/logo.png', 'logo',
    'N S N College of Engineering and Technology, Karur-Madurai NH7, Manalmedu, Karur Distr official logo', 0, false, 'https://nsn.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    328, 'https://www.ksriet.ac.in/admin/uploads/general/1706763843logo.jpeg', 'logo',
    'K S R Institute for Engineering and Technology(Autonomous), Thokkavadi, Namakkal Distr official logo', 0, false, 'https://www.ksriet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    329, 'https://rtc.ac.in/wp-content/uploads/2023/04/RTC-Logo-Updated-2025-scaled.png', 'logo',
    'Rathinam Technical Campus(Autonomous), Pollachi Road, Eachanari, Coimbatore District 6 official logo', 0, false, 'https://rtc.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    329, 'https://rtc.ac.in/wp-content/uploads/2025/12/Rectangle-294.png', 'campus',
    'Rathinam Technical Campus(Autonomous), Pollachi Road, Eachanari, Coimbatore Di official campus image', 0, false, 'https://rtc.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    332, 'http://ganeshenggcollege.org/images/logo/logo3.png', 'logo',
    'Ganesh College of Engineering, Attur Main Road, Mettupatti, Salem District official logo', 0, false, 'http://ganeshenggcollege.org/',
    'permission_required', 'Official college website', now()
  ),
(
    333, 'https://sriet.ac.in/wp-content/uploads/2026/05/Logo-scaled.png', 'logo',
    'Sri Ranganathar Institute of Engineering and Technology, Thudialur-Kovilpalay Road, Co official logo', 0, false, 'https://www.sriet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    334, 'https://www.iihtsalem.edu.in/wp-content/uploads/2021/05/textail-logo-02.png', 'logo',
    'Indian Institute of Handloom Technology, Foulke''s Compound, Thillai Nagar, Salem Distr official logo', 0, false, 'https://www.iihtsalem.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    335, 'https://www.ksakongu.edu.in/assets/images/keclogo.jpeg', 'logo',
    'Kongu School of Architecture, Kongu Engineering College Campus, Perundurai Railway Sta official logo', 0, false, 'https://www.ksakongu.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    336, 'https://www.dgct.ac.in/assets/dgctlogo2.png', 'logo',
    'Dhirajlal Gandhi College of Technology, Sikkanampatty, (Opp. to Airport), Omalur Taluk official logo', 0, false, 'https://www.dgct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    336, 'https://www.dgct.ac.in/assets/img/front/dgct-main-building.jpg', 'campus',
    'Dhirajlal Gandhi College of Technology, Sikkanampatty, (Opp. to Airport), Omal official campus image', 0, false, 'https://www.dgct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    340, 'https://www.dhaanishitech.ac.in/og-image.png', 'campus',
    'Dhaanish Ahmed Institute of Technology, Pichanur Post, (Near K G Chavadi), Coi official campus image', 0, false, 'https://www.dhaanishitech.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    341, 'https://www.jairupa.org/College-logo.jpg', 'logo',
    'Jairupaa College of Engineering, Thottiapalayam, Kathankanni Post, Kangayam, Tiruppur official logo', 0, false, 'https://www.jairupa.org/',
    'permission_required', 'Official college website', now()
  ),
(
    343, 'https://arulmurugan.edu.in/wp-content/uploads/2026/02/Arulmurugan-College-200x215.jpg', 'logo',
    'Arulmurugan College of Engineering, Karvazhi Road, Thennilai Post, Karur District 6392 official logo', 0, false, 'https://arulmurugan.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    344, 'https://vsbcetc.edu.in/wp-content/uploads/al_opt_content/IMAGE/vsbcetc.edu.in/wp-content/uploads/2024/04/logo-1024x441.png.bv.webp?bv_host=vsbcetc.edu.in', 'logo',
    'V S B College of Engineering Technical Campus, EalurPirivu, Solavampalayam Post, Coimb official logo', 0, false, 'https://vsbcetc.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    344, 'https://vsbcetc.edu.in/wp-content/uploads/2026/03/BUILDING-ENGINEERs-BEYOND-CLASSROOM.png', 'campus',
    'V S B College of Engineering Technical Campus, EalurPirivu, Solavampalayam Pos official campus image', 0, false, 'https://vsbcetc.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    345, 'https://www.sugunace.com/logo.png', 'logo',
    'Suguna College of Engineering, Kalappatti Road, Civil Aerodrome Post, Coimbatore Distr official logo', 0, false, 'https://www.sugunace.com/',
    'permission_required', 'Official college website', now()
  ),
(
    346, 'https://scsa.ac.in/wp-content/uploads/2020/06/scsa-logo.png', 'logo',
    'Sasi Creative School of Archiecture, No.293/2B, Roja Raja Garden, Pollachi Main Road, official logo', 0, false, 'https://scsa.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    347, 'https://www.soaciet.edu.in/img/logo/logo.png', 'logo',
    'School of Architecture Coimbatore Institute of Engineering and Technology, VellimalaiP official logo', 0, false, 'https://www.soaciet.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    353, 'https://www.hsoa.ac.in/webassets/wp-content/uploads/2021/01/logo.jpg', 'logo',
    'Hindusthan School of Architecture, Othakkalmandabam Post, Coimbatore District 641032 official logo', 0, false, 'https://www.hsoa.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    355, 'https://psgitech.ac.in/assets/images/psgitarlogo.webp', 'logo',
    '641062 official logo', 0, false, 'https://psgitech.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    361, 'https://www.mkce.ac.in/images/mkce-campus.jpg', 'campus',
    'M Kumarasamy College of Engineering (Autonomous), Thalavapalayam, Karur Distri official campus image', 0, false, 'https://www.mkce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    362, 'https://mahendra.info/wp-content/uploads/2026/04/logo-white1-min.png', 'logo',
    'Mahendra Engineering College (Autonomous), Mahendhirapuri, Mallasamudram, Namakkal Dis official logo', 0, false, 'https://mahendra.info/',
    'permission_required', 'Official college website', now()
  ),
(
    363, 'https://mec.edu.in/storage/2021/02/main-logo.png', 'logo',
    'Muthayammal Engineering College (Autonomous), Rasipuram, Namakkal District 637408 official logo', 0, false, 'https://mec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    364, 'https://pec.paavai.edu.in/wp-content/uploads/2025/11/NAAC-icon.png', 'campus',
    'Paavai Engineering College (Autonomous), NH-7, Pachal Post, Namakkal District official campus image', 0, false, 'https://pec.paavai.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    370, 'https://sect.edu.in/images/college1.webp', 'logo',
    'Sengunthar Engineering College (Autonomous), Tiruchengode, Namakkal District 637205 official logo', 0, false, 'https://sect.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    374, 'https://vsbec.edu.in/wp-content/uploads/2023/10/logo-1024x441.png', 'logo',
    'V S B Engineering College(Autonomous),Kovai Road, Karur District 639111 official logo', 0, false, 'https://vsbec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    374, 'https://vsbec.edu.in/wp-content/uploads/2026/02/ssss.png', 'campus',
    'V S B Engineering College(Autonomous),Kovai Road, Karur District 639111 official campus image', 0, false, 'https://vsbec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    377, 'https://kavery.org.in/assets/img/title.png', 'campus',
    'The Kavery Engineering College, M Kalipatti Post, Mecheri, Salem District official campus image', 0, false, 'https://www.kavery.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    378, 'https://selvamtech.edu.in/wp-content/uploads/2024/05/SCT-Logo-Web-01.png', 'logo',
    'Selvam College of Technology, Pappanaickenpatti Post, Namakkal District official logo', 0, false, 'https://selvamtech.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    378, 'https://selvamtech.edu.in/wp-content/uploads/2022/06/DJI_0116.jpg', 'campus',
    'Selvam College of Technology, Pappanaickenpatti Post, Namakkal District official campus image', 0, false, 'https://selvamtech.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    379, 'https://pce.paavai.edu.in/wp-content/uploads/2019/03/3.png', 'logo',
    'Paavai College of Engineering,(Autonomous), NH-7, Pachal Post, Namakkal District 63701 official logo', 0, false, 'https://pce.paavai.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    380, 'https://www.chettinadtech.ac.in/assets/images/CCET_Logo.png', 'logo',
    'Chettinad College of Engineering and Technology, NH-67, Trichy Main Road, Puliyur C F, official logo', 0, false, 'https://www.chettinadtech.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    383, 'https://excelinstitutions.com/wp-content/uploads/2021/01/logo.png', 'logo',
    'Excel Engineering College (Autonomous), NH-544, Salem Main Road, Pallakapalayam, Sanka official logo', 0, false, 'https://excelinstitutions.com/',
    'permission_required', 'Official college website', now()
  ),
(
    385, 'https://www.avsenggcollege.ac.in/img/logo%20at-02.png', 'logo',
    'A V S Engineering College, Military Road, Ammapet, Salem District 636003 official logo', 0, false, 'https://www.avsenggcollege.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    389, 'https://livesydneypools.org/img/logo.webp', 'logo',
    'VaruvanVadivelan Institute of Technology, Nallanahalli, Dharmapuri District official logo', 0, false, 'https://livesydneypools.org/',
    'permission_required', 'Official college website', now()
  ),
(
    389, 'https://livesydneypools.org/img/banner-new.png', 'campus',
    'VaruvanVadivelan Institute of Technology, Nallanahalli, Dharmapuri District official campus image', 0, false, 'https://livesydneypools.org/',
    'permission_required', 'Official college website', now()
  ),
(
    390, 'https://psvcet.ac.in/wp-content/uploads/2024/02/Logo-web-1024x1024.png', 'logo',
    'P S V College of Engineeering and Technology, Mittapalli, Balinayanapalli Post, Elatha official logo', 0, false, 'https://psvcet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    391, 'https://biew.ac.in/wp-content/uploads/2022/11/Biew-Logo-3.png', 'logo',
    'Bharathiyar Institute of Engineering for Women, Deviayakurichi, Attur Taluk, Salem Dis official logo', 0, false, 'https://biew.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    393, 'https://images.unsplash.com/photo-1581092921461-eab62e97a783?q=80&amp;w=1200', 'campus',
    'J K K Nataraja College of Engineering and Technology, Komarapalayam Amani, Tha official campus image', 0, false, 'https://engg.jkkn.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    394, 'https://www.aecsalem.edu.in/images/logos/ANNAPOORANA_white.png', 'logo',
    'Annapoorana Engineering College (Autonomous), Sankari Main Road, NH-47, Periaseeragapa official logo', 0, false, 'https://www.aecsalem.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    395, 'https://www.ckec.ac.in/images/Header%20after%20NAAC_1%20(1).jpg', 'logo',
    'Christ The King Engineering College, Cecilia Gardens, Chikkarampalayam Village, Coimba official logo', 0, false, 'https://www.ckec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    397, 'https://alameen.ac.in/wp-content/uploads/2023/09/Abouhome-t.png', 'campus',
    'AL-Ameen Engineering College (Autonomous), KarundevanPalayam, NanjaiUthukuli P official campus image', 0, false, 'https://alameen.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    398, 'https://i0.wp.com/kiot.ac.in/wp-content/uploads/2025/03/WEB-LOGO-01.jpg?resize=1000%2C133&#038;ssl=1', 'logo',
    'Knowledge Institute of Technology(Autonomous), KIOT Campus, Kakapalayam Post, Salem Di official logo', 0, false, 'https://kiot.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    398, 'https://kiot.ac.in/wp-content/uploads/2022/04/kiot-logo.png', 'campus',
    'Knowledge Institute of Technology(Autonomous), KIOT Campus, Kakapalayam Post, official campus image', 0, false, 'https://kiot.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    403, 'https://www.miet.asia/images/slide_26.jpeg', 'logo',
    'Mahendra Institute of Engineering and Technology, Mahendrapuri, Mallasamudram, Namakka official logo', 0, false, 'https://www.miet.asia/',
    'permission_required', 'Official college website', now()
  ),
(
    404, 'https://excelinstitutions.com/excel_arch/wp-content/uploads/2021/08/logo-350x64.png', 'logo',
    'Excel College of Architecture and Planning, NH-544, Salem Main Road, Pallakapalayam, S official logo', 0, false, 'https://excelinstitutions.com/excel_arch/',
    'permission_required', 'Official college website', now()
  ),
(
    405, 'https://www.sreesakthi.edu.in/assets/img/new-images/logo-full.webp', 'logo',
    'Sree Sakthi Engineering College, Bettathapuram, Bilichi Village, Karamadai, Coimbatore official logo', 0, false, 'https://www.sreesakthi.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    406, 'https://shreenivasa.info/images/Shreenivasalogo.jpg', 'campus',
    'Shreenivasa Engineering College, B Pallipatti, Bommidi, Pappireddipatti Taluk, official campus image', 0, false, 'https://shreenivasa.info/',
    'permission_required', 'Official college website', now()
  ),
(
    407, 'https://www.bitsathy.ac.in/wp-content/themes/baiotsathycollege/assets/images/ban-fb.png', 'logo',
    'Bannari Amman Institute of Technology (Autonomous), Sathyamanagalam, Erode District 63 official logo', 0, false, 'https://www.bitsathy.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    407, 'https://www.bitsathy.ac.in/wp-content/uploads/cropped-bit_logo.png', 'campus',
    'Bannari Amman Institute of Technology (Autonomous), Sathyamanagalam, Erode Dis official campus image', 0, false, 'https://www.bitsathy.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    408, 'https://www.cietcbe.edu.in/images/logo.png', 'logo',
    'Coimbatore Institute of Engineering and Technolgoy (Autonomous), Narasipuram Post, Coi official logo', 0, false, 'https://www.cietcbe.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    409, 'https://csice.edu.in/wp-content/uploads/al_opt_content/IMAGE/csice.edu.in/wp-content/uploads/2025/11/CSIlogo.png?bv_host=csice.edu.in&amp;bv-resized-infos=bv_resized_mobile%3A480%2A150%3Bbv_resized_ipad%3A820%2A256%3Bbv_resized_desktop%3A1344%2A419', 'logo',
    'CSI College of Engineering, Ketti, The Nilgiris 643215 official logo', 0, false, 'https://csice.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    411, 'https://erode-sengunthar.ac.in/wp-content/uploads/2026/05/ascent2026.jpeg', 'campus',
    'Erode Sengunthar Engineering College (Autonomous), Thudupathi Post, Erode Dist official campus image', 0, false, 'https://erode-sengunthar.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    412, 'https://www.hindusthan.net/assets/college_logos/hindusthan_logo_white.png', 'logo',
    'Hindusthan College of Engineering and Technology (Autonomous), Othakkalmandapam Post, official logo', 0, false, 'https://www.hindusthan.net/',
    'permission_required', 'Official college website', now()
  ),
(
    412, 'https://www.hindusthan.net/assets/hindusthan_images/hindusthan_logo.png', 'campus',
    'Hindusthan College of Engineering and Technology (Autonomous), Othakkalmandapa official campus image', 0, false, 'https://www.hindusthan.net/',
    'permission_required', 'Official college website', now()
  ),
(
    413, 'https://www.gcee.ac.in/assets/img/themes/IRTTlogo.jpg', 'logo',
    'Government Engineering College (Formerly Institute of Road and Transport Technology), official logo', 0, false, 'https://www.gcee.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    414, 'https://kce.ac.in/_next/image?url=%2F_next%2Fstatic%2Fmedia%2FKCE-logo-color.4bf34a82.png&amp;w=384&amp;q=75&amp;dpl=dpl_DYEJZTb3C6f8yfSwN9zKRwFLiY19', 'logo',
    'Karpagam College of Engineering (Autonomous), Othakkalmandapam, Coimbatore District 64 official logo', 0, false, 'https://kce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    416, 'https://kct.ac.in/wp-content/uploads/2024/05/KCT-N.png', 'logo',
    'Kumaraguru College of Technology (Autonomous), Chinnavedampatti Post, Coimbatore Distr official logo', 0, false, 'https://kct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    416, 'https://kct.ac.in/wp-content/uploads/2024/06/Home-banner.webp', 'campus',
    'Kumaraguru College of Technology (Autonomous), Chinnavedampatti Post, Coimbato official campus image', 0, false, 'https://kct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    417, 'https://mpnmjec.ac.in/wp-content/uploads/2024/10/mpnmjec.png', 'logo',
    'M P Nachimuthu M Jaganathan Engineering College, Chennimalai, Erode District 638112 official logo', 0, false, 'https://mpnmjec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    418, 'https://nandhaengg.org/wp-content/uploads/2024/10/aci-logo.jpg', 'logo',
    'Nandha Engineering College (Autonomous), Pitchandampalayam Post, Erode District 638052 official logo', 0, false, 'https://nandhaengg.org/',
    'permission_required', 'Official college website', now()
  ),
(
    419, 'https://www.pcet.ac.in/wp-content/themes/park-theme/assets/img/new-logo.png', 'logo',
    'Park College of Engineering and Technology, Kaniyur, Coimbatore District official logo', 0, false, 'https://www.pcet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    421, 'https://skcet.ac.in/wp-content/uploads/2024/08/skcet-logo.png', 'logo',
    'Sri Krishna College of Enginering and Technology (Autonomous) ,Kuniamuthur, Coimbatore official logo', 0, false, 'https://skcet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    423, 'https://tnce.ac.in/images/TNCE-logo.png', 'logo',
    'Tamilnadu College of Engineering, Karumathampatti Post, Coimbatore District official logo', 0, false, 'https://tnce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    424, 'https://skct.edu.in/wp-content/uploads/2024/01/skct-logo.png', 'logo',
    'Sri Krishna College of Technology (Autonomous) ,Kovaipudur Post, Coimbatore District 6 official logo', 0, false, 'https://skct.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    427, 'https://snsct.snscourseware.org/images/logo%20copy.png', 'logo',
    'SNS College of Technology (Autonomous), Kalappatti Post, Coimbatore District official logo', 0, false, 'https://snsct.org/',
    'permission_required', 'Official college website', now()
  ),
(
    429, 'https://www.tnsa.ac.in/images/logo-img.png', 'logo',
    'Tamilnadu School of Architecture, Tamilnadu College of Engineering Campus, Karumathamp official logo', 0, false, 'https://www.tnsa.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    430, 'https://www.nehrucolleges.org/assets/favicon-256.png', 'campus',
    'Nehru Institute of Engineering and Technology, Thirumalayampalayam Post, Coimb official campus image', 0, false, 'https://www.nehrucolleges.org/',
    'permission_required', 'Official college website', now()
  ),
(
    431, 'https://rvscet.ac.in/wp-content/themes/rvscet-cms/homeassets/img/logo/RVS-College-Logo-White.png', 'logo',
    'R V S College of Engineering and Technology, Kannampalayam, Sulur, Coimbatore District official logo', 0, false, 'https://rvscet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    432, 'http://www.infoengg.com/templates/beez3/infocollege/images/info-college-logo.png', 'logo',
    'Info Institute of Engineering, Sarkar Samakulam, Coimbatore District 641107 official logo', 0, false, 'http://www.infoengg.com/',
    'permission_required', 'Official college website', now()
  ),
(
    435, 'https://karpagamtech.ac.in/kit/wp-content/uploads/2025/06/KIT-UPDATED-LOGO.png', 'logo',
    'Karpagam Institute of Technology, Seerapalayam Village, L&T By pass Road, Coimbatore D official logo', 0, false, 'https://karpagamtech.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    436, 'https://www.drngpit.ac.in/images/logos/ngp-itech-logo_v2.png', 'logo',
    'Dr. N G P Institute of Technology (Autonomous), Kalapatti Road, Coimbatore District 64 official logo', 0, false, 'https://www.drngpit.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    436, 'https://www.drngpit.ac.in/images/favicons/og-image.jpg', 'campus',
    'Dr. N G P Institute of Technology (Autonomous), Kalapatti Road, Coimbatore Dis official campus image', 0, false, 'https://www.drngpit.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    437, 'https://www.reccbe.ac.in/assets/img/logo-1.jpg', 'logo',
    'Sri Sai Ranganathan Engineering College, Zahirnaickenpalayam Village, Viraliyur Post, official logo', 0, false, 'https://www.reccbe.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    439, 'https://hit.edu.in/assets/hindusthan_images/hit_logo.jpg', 'logo',
    'Hindusthan Institute of Technology (Autonomous), Othakkalmandapam, Coimbatore District official logo', 0, false, 'https://hit.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    439, 'https://hit.edu.in/assets/hindusthan_images/hindusthan_logo.png', 'campus',
    'Hindusthan Institute of Technology (Autonomous), Othakkalmandapam, Coimbatore official campus image', 0, false, 'https://hit.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    441, 'https://dsce.ac.in/wp-content/uploads/2021/03/LOGO-WHITE-01-300x300.png', 'logo',
    'Dhanalakshmi Srinivasan College of Engineering (CBE), NH47, Palakkad Main Road, Navakk official logo', 0, false, 'https://dsce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    442, 'https://adithyatech.edu.in/wp-content/uploads/2024/12/adithya-logo-anim.gif', 'logo',
    'Adithya Institute of Technology, Kurumbapalayam Village, Coimbatore District official logo', 0, false, 'https://adithyatech.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    444, 'https://www.svhec.com/wp-content/uploads/2024/03/Logo_new.png', 'logo',
    'Shree Venkateshwara Hi-Tech Engineering College, (Autonomous) Othakuthirai, K Mettupal official logo', 0, false, 'https://www.svhec.com/',
    'permission_required', 'Official college website', now()
  ),
(
    445, 'https://www.surya.ac.in/assets/img/logo.png', 'logo',
    'Surya Engineering College, Mettukadai, Kathirampatti Post, Erode District official logo', 0, false, 'https://www.surya.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    447, 'https://www.kitcbe.com/assets/img/admissionbutton.gif', 'logo',
    'KIT - Kalaignar Karunanidhi Institute of Technology (Autonomous), Kannampalayam, Coimb official logo', 0, false, 'https://www.kitcbe.com/',
    'permission_required', 'Official college website', now()
  ),
(
    448, 'https://www.kgkite.ac.in/wp-content/uploads/2025/12/KiTE-logo-01.webp', 'logo',
    'KGISL Institute of Technology, KGISL Campus, Thudiyalur Road, Saravanampatti, Coimbato official logo', 0, false, 'https://www.kgkite.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    448, 'https://www.kgkite.ac.in/wp-content/uploads/2026/04/KiTE-logo-01-1.png', 'campus',
    'KGISL Institute of Technology, KGISL Campus, Thudiyalur Road, Saravanampatti, official campus image', 0, false, 'https://www.kgkite.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    450, 'https://www.ppg.edu.in/assets/images/pic/logo.png', 'logo',
    'PPG Institute of Technology, Vilankurichi Village, Coimbatore District 641035 official logo', 0, false, 'https://www.ppg.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    451, 'https://nitcbe.ac.in/wp-content/uploads/2021/12/college-logo-1024x245.png', 'logo',
    'Nehru Institute of Technology(Autonomous), Thirumalayampalayam Post, Coimbatore Distri official logo', 0, false, 'http://nitcbe.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    455, 'https://jit.ac.in/assets/uploads/2026/06/new-logo-website-1.png', 'logo',
    'Jansons Institute of Technology, Karumathampatty, Somaur, Coimbatore District 641659 official logo', 0, false, 'https://jit.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    455, 'https://jit.ac.in/assets/uploads/2022/03/cropped-jit_logo_wide.png', 'campus',
    'Jansons Institute of Technology, Karumathampatty, Somaur, Coimbatore District official campus image', 0, false, 'https://jit.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    457, 'https://kpriet.ac.in/asset/frontend/images/logo/kprietLogo.png', 'logo',
    'K P R Institute of Engineering and Technology (Autonomous), Kollupalayam Village, Aras official logo', 0, false, 'https://kpriet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    457, 'https://kpriet.ac.in/asset/frontend/etc.clientlibs/kpr/clientlibs/clientlib-site/resources/favicon.png', 'campus',
    'K P R Institute of Engineering and Technology (Autonomous), Kollupalayam Villa official campus image', 0, false, 'https://kpriet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    459, 'https://www.pct.ac.in/img/new-logo.png', 'logo',
    'Park College of Technology, Prema Ravi Nagar, Karumathampatti, Coimbatore - official logo', 0, false, 'https://www.pct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    460, 'https://www.jct.ac.in/_next/image?url=%2Flogo%2Fjct_logo.webp&amp;w=3840&amp;q=75', 'logo',
    'J C T College of Engineering and Technology, Pichanur, Coimbatore District official logo', 0, false, 'https://www.jct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    463, 'https://www.rvstcc.ac.in/wp-content/uploads/2024/12/rvs-final-logo.png', 'logo',
    'R V S Technical Campus-Coimbatore, Kumaran Kottam Campus, Kannampalayam, Sulur, Coimba official logo', 0, false, 'https://www.rvstcc.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    467, 'https://www.auucea.edu.in/assets/assets/images/logo.png', 'logo',
    'University College of Engineering, Ariyalur, Kathankudikadu Village, Thelur Post, Ariy official logo', 0, false, 'https://www.auucea.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    469, 'https://www.ucep.edu.in/uceplogo.png', 'logo',
    'University College of Engineering, Panruti, Chennai-Kumbakonam Highway, Panikkankuppam official logo', 0, false, 'https://www.ucep.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    472, 'https://kcet.in/assets/app_files/logo/kcet_logo.png', 'logo',
    'Krishnasamy College of Engineering and Technology, S Kumarapuram, Cuddalore District 6 official logo', 0, false, 'https://www.kcet.in/',
    'permission_required', 'Official college website', now()
  ),
(
    472, 'https://www.kcet.in/assets/images/college-campus.jpg', 'campus',
    'Krishnasamy College of Engineering and Technology, S Kumarapuram, Cuddalore Di official campus image', 0, false, 'https://www.kcet.in/',
    'permission_required', 'Official college website', now()
  ),
(
    477, 'https://kskcet.edu.in/wp-content/uploads/2026/04/ksksk.jpg', 'campus',
    'K S K College of Engineering and Technology, Thanjavur Main Road, Darasuram, K official campus image', 0, false, 'https://kskcet.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    479, 'https://www.aitech.org.in/assets/img/ait_logo.png', 'logo',
    'Arifa Institute of Technology (Formly Haji sheik Ismail Engineering College), Esanoor, official logo', 0, false, 'https://www.aitech.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    485, 'https://krct.ac.in/og-default.jpg', 'campus',
    'K Ramakrishnan College of Technology (Autonomous), Kariyamanickam Road, Samaya official campus image', 0, false, 'https://krct.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    486, 'https://sincet.ac.in/images/logo/tnac-logo.png', 'logo',
    'Sir Issac Newton College of Engineering and Technology, Anthanapeetai Post, Papakoil, official logo', 0, false, 'https://sincet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    488, 'https://www.oasys.edu.in/images/logo.png', 'logo',
    'OASYS Institute of Technology, Pulivalam Village, Musiri Taluk, Tiruchirappalli Distri official logo', 0, false, 'https://www.oasys.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    488, 'http://www.oasys.edu.in/images/logo.png', 'campus',
    'OASYS Institute of Technology, Pulivalam Village, Musiri Taluk, Tiruchirappall official campus image', 0, false, 'https://www.oasys.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    490, 'https://care.ac.in/architecture/wp-content/uploads/sites/3/2025/03/DJI_0038-1-1-scaled.jpg', 'campus',
    'C.A.R.E School of Architecture, No.27, Thayanur Village, Kuttapatti, Srirangam official campus image', 0, false, 'https://care.ac.in/architecture/',
    'permission_required', 'Official college website', now()
  ),
(
    491, 'https://mamse.in/img/mam-new.png', 'logo',
    'M.A.M. School of Engineering, Siruganur, Tiruchirappalli District 621105 official logo', 0, false, 'https://mamse.in/',
    'permission_required', 'Official college website', now()
  ),
(
    493, 'https://www.avccengg.net/images/final.jpg', 'logo',
    'A V C College of Engineering, Mannampandal Post, MayiladuthuraiDistrict official logo', 0, false, 'https://www.avccengg.net/',
    'permission_required', 'Official college website', now()
  ),
(
    495, 'https://a.storyblok.com/f/286279/426x379/10b386af74/aamec_logo.webp', 'logo',
    'Anjalai Ammal Mahalingam Engineering College, Kovilvenni, Thiruvarur District official logo', 0, false, 'https://www.aamec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    495, 'https://a.storyblok.com/f/286279/1200x630/65a601693c/381c5632-802c-4ab0-b0ac-851b9c421471.png', 'campus',
    'Anjalai Ammal Mahalingam Engineering College, Kovilvenni, Thiruvarur District official campus image', 0, false, 'https://www.aamec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    496, 'https://aec.org.in/wp-content/themes/aec2026/images/logo.png', 'logo',
    'Arasu Engineering College, Chennai Main Road, Kumbakonam, Thanjavur District 612501 official logo', 0, false, 'https://aec.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    498, 'https://www.egspec.org/assets/images/logo_tran.svg', 'logo',
    'E G S Pillay Engineering College (Autonomous), Nagapattinam District 611002 official logo', 0, false, 'https://www.egspec.org/',
    'permission_required', 'Official college website', now()
  ),
(
    498, 'https://egspec.blob.core.windows.net/egspec-assets/og_image.webp', 'campus',
    'E G S Pillay Engineering College (Autonomous), Nagapattinam District 611002 official campus image', 0, false, 'https://www.egspec.org/',
    'permission_required', 'Official college website', now()
  ),
(
    500, 'https://www.jayaramcet.edu.in/public/Images/front.jpg', 'logo',
    'Jayaram College of Engineering and Technology, Karattampatti, Pagalavadi Po, Thuraivur official logo', 0, false, 'https://www.jayaramcet.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    502, 'https://www.mamce.org/public/images/5.png', 'logo',
    'M.A.M. College of Engineering, Siruganur, Tiruchirappalli District 621105 official logo', 0, false, 'https://www.mamce.org/',
    'permission_required', 'Official college website', now()
  ),
(
    504, 'https://www.mookambigai.ac.in/img/logo.png', 'logo',
    'Mookambigai College of Engineering, Keeranur, Pudukkottai District 622502 official logo', 0, false, 'https://www.mookambigai.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    508, 'https://roeverengg.edu.in/wp-content/uploads/2020/06/rec-logo.png', 'logo',
    'Roever Engineering College, Elambalur, Perambalur District 621212 official logo', 0, false, 'https://roeverengg.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    509, 'https://www.saranathan.ac.in/img/icon/Bus-Hostel%20Logo.jpg', 'logo',
    'Saranathan College of Engineering, Panjappur, Tiruchirappalli District 620012 official logo', 0, false, 'https://www.saranathan.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    510, 'https://www.trichyengg.ac.in/images/f1.png', 'logo',
    'Trichy Engineering College, Konalai, Tiruchirappalli District 621132 official logo', 0, false, 'https://www.trichyengg.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    513, 'https://sjcettnj.edu.in/static/images/homelogo.png', 'logo',
    'St. Joseph''s College of Engineering and Technology, Elupatti Village, Rawaspatti Post, official logo', 0, false, 'https://sjcettnj.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    514, 'https://kongunadu.ac.in/wp-content/uploads/2024/12/logo1.png', 'logo',
    'Kongunadu College of Engineering and Technology (Autonomous), Tholurpatti, Thottiyam, official logo', 0, false, 'https://kongunadu.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    515, 'https://mamcet.com/wp-content/uploads/2024/02/logo.png', 'logo',
    'M.A.M. College of Engineering and Technology, Trichy-Chennai Trunk Road, Siruganur, Ti official logo', 0, false, 'https://mamcet.com/',
    'permission_required', 'Official college website', now()
  ),
(
    519, 'https://care.ac.in/wp-content/uploads/2019/01/care-logo.png', 'logo',
    'CARE College of Engineering (Formerly C.A.R.E Group of Institutions), Thayanoor Villag official logo', 0, false, 'https://care.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    520, 'https://mrkit.edu.in/assets/images/resources/MRK-IT-College-Logo.jpg', 'logo',
    'M R K Institute of Technology, Nattarmangalam Village, Kattumannarkoil, Cuddalore Dist official logo', 0, false, 'https://mrkit.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    521, 'https://a.storyblok.com/f/299015/253x75/d0338dd150/shivani-logo.jpg', 'campus',
    'Shivani Engineering College, Trichy-Dindigul NH Road, Poolangulathupatti, Tiru official campus image', 0, false, 'https://www.shivani.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    525, 'https://www.annaiengg.org/uploads/20260512_104155_3c74b1a2.png', 'campus',
    'Annai College of Engineering and Technology, Anakudi Road, Kovilacheri, Kumbak official campus image', 0, false, 'https://www.annaiengg.org/',
    'permission_required', 'Official college website', now()
  ),
(
    527, 'https://www.sbec.edu.in/icons/logo/logo.png', 'logo',
    'Sri Bharathi Engineering College for Women, Kaikkuruchi Village, Alangudi Taluk, Puduk official logo', 0, false, 'https://www.sbec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    528, 'https://5-starstaffing.com/logo.gif', 'logo',
    'Mahath Amma Institute of Engineering and Technology (MIET), Ariyur, Annavasal Road, Il official logo', 0, false, 'https://5-starstaffing.com/',
    'permission_required', 'Official college website', now()
  ),
(
    528, 'https://5-starstaffing.com/https', 'campus',
    'Mahath Amma Institute of Engineering and Technology (MIET), Ariyur, Annavasal official campus image', 0, false, 'https://5-starstaffing.com/',
    'permission_required', 'Official college website', now()
  ),
(
    531, 'https://www.srvgroups.in/logo%20(1).png', 'logo',
    'Sembodai Rukmani Varadharajan Engineering College, Sembodhai Village, Vadaraniam, Naga official logo', 0, false, 'https://www.srvgroups.in/',
    'permission_required', 'Official college website', now()
  ),
(
    534, 'https://www.mzcet.in/assets/img/mzcetlogo.png', 'logo',
    'Mount Zion College of Engineering and Technology, Pilivalam Post, Pudukkottai District official logo', 0, false, 'https://www.mzcet.in/',
    'permission_required', 'Official college website', now()
  ),
(
    536, 'https://www.sec.ac.in/assets/images/logo/header-final-logo.svg', 'logo',
    'Sudharsan Engineering College, Sathiyamangalam Post, Pudukkottai District official logo', 0, false, 'https://www.sec.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    542, 'https://tec-edu.in/images/logo.jpg', 'logo',
    'Thamirabharani Engineering College, Chathirampudukulam Village, Thatchanallur, Tirunel official logo', 0, false, 'https://tec-edu.in/index',
    'permission_required', 'Official college website', now()
  ),
(
    543, 'https://www.rcet.org.in/images/rcet-autonomous.png', 'logo',
    'Rohini College of Engineering & Technology, Anjugramam-Kanyakumari Main Road, Palkulam official logo', 0, false, 'https://www.rcet.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    543, 'https://www.rcet.org.in/images/rcetDifference.jpg', 'campus',
    'Rohini College of Engineering & Technology, Anjugramam-Kanyakumari Main Road, official campus image', 0, false, 'https://www.rcet.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    545, 'https://webdocs.pages.dev/assets/img/SMCOE%20Autonomous%20Anna.png', 'logo',
    'Stella Mary''s College of Engineering, ArunthenganVilai, Azhikal Post, Kanyakumari Dist official logo', 0, false, 'https://www.stellamaryscoe.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    547, 'https://rvce.ac.in/wp-content/uploads/2026/03/TCS-logo-black-CMYK.svg', 'logo',
    'RenganayagiVaratharaj College of Engineering, Salvarpatti, Sivakasi, Virudhunagar Dist official logo', 0, false, 'https://rvce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    547, 'https://rvce.ac.in/wp-content/uploads/2026/03/G4.jpg', 'campus',
    'RenganayagiVaratharaj College of Engineering, Salvarpatti, Sivakasi, Virudhuna official campus image', 0, false, 'https://rvce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    552, 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_180,h_180/https://gscet.org/wp-content/uploads/2020/07/180logo.png', 'logo',
    'Good Shepherd College of Engineering and Technology, Maruthamparai, Kanyakumari Distri official logo', 0, false, 'https://gscet.org/',
    'permission_required', 'Official college website', now()
  ),
(
    554, 'https://sethu.ac.in/wp-content/uploads/2026/05/Untitled-design3.png', 'logo',
    'Sethu Institute of Technology (Autonomous), Kariapatti Post, Virudhunagar District 626 official logo', 0, false, 'https://sethu.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    559, 'https://grace.edu.in/assets/img/gcoe_logo.png', 'logo',
    'Grace College of Engineering, Chandy Nagar, Mullakkadu, Thoothukudi District official logo', 0, false, 'https://grace.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    562, 'https://www.holycrossengineeringcollege.com/img/l1.png', 'logo',
    'Holy Cross Engineering College, Vagaikulam, Sri Mulakarai, Srivaikuntam, Thoothukudi D official logo', 0, false, 'https://www.holycrossengineeringcollege.com/',
    'permission_required', 'Official college website', now()
  ),
(
    564, 'https://lovable.dev/opengraph-image-p98pqg.png', 'campus',
    'Sivaji College of Engineering and Technology, ManivillaPalulai Panchayat, Vila official campus image', 0, false, 'https://www.sivajicollegeofengineering.com/',
    'permission_required', 'Official college website', now()
  ),
(
    565, 'https://uitkovilpatti.ac.in/wp-content/uploads/2023/10/cropped-UIT-LOGO-PNG-1-120x120.png', 'logo',
    'Unnamalai Institute of Technology, Ayyaneri, Kovilpatti, Thoothukudi District official logo', 0, false, 'https://uitkovilpatti.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    567, 'https://www.arunachalacollege.com/images/arunachala_logo.png', 'logo',
    'Arunachala College of Engineering for Women, Thanka Gardens, Manavilai, Vellichanthai, official logo', 0, false, 'https://www.arunachalacollege.com/',
    'permission_required', 'Official college website', now()
  ),
(
    567, 'http://arunachalacollege.com/images/acewlogo.png', 'campus',
    'Arunachala College of Engineering for Women, Thanka Gardens, Manavilai, Vellic official campus image', 0, false, 'https://www.arunachalacollege.com/',
    'permission_required', 'Official college website', now()
  ),
(
    571, 'https://www.csiit.ac.in/wp-content/uploads/2026/04/college-logo.jpg-removebg-preview.png', 'campus',
    'C S I Institute of Technology, Thovalai, Kanyakumari District 629302 official campus image', 0, false, 'https://www.csiit.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    573, 'https://www.aditanarcolleges.com/images/og-image.jpg', 'campus',
    'Dr.SivanthiAditanar College of Engineering, Tiruchendur, Thoothukudi District official campus image', 0, false, 'https://drsacoe.org/',
    'permission_required', 'Official college website', now()
  ),
(
    574, 'https://francisxavier.ac.in/cs-content/uploads/2022-2023/MediaWiki-logo.png', 'logo',
    'Francis Xavier Engineering College (Autonomous), Vannarpettai, Tirunelveli District 62 official logo', 0, false, 'https://www.francisxavier.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    574, 'https://www.francisxavier.ac.in/cs-content/themes/fxec/images/logo.png', 'campus',
    'Francis Xavier Engineering College (Autonomous), Vannarpettai, Tirunelveli Dis official campus image', 0, false, 'https://www.francisxavier.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    577, 'https://www.kamarajengg.edu.in/static/home/kcetlogo.png', 'logo',
    'Kamaraj College of Engineering and Technology (Autonomous), Virudhunagar District 6260 official logo', 0, false, 'https://www.kamarajengg.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    578, 'https://www.mepcoeng.ac.in/img/logo.svg', 'logo',
    'Mepco Schlenk Engineering College (Autonomous), Sivakasi, Virudhunagar District 626005 official logo', 0, false, 'https://www.mepcoeng.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    579, 'https://nce.ac.in/wp-content/uploads/2026/01/HCL_LOGO.png', 'logo',
    'Nellai College of Engineering (Formerly National College of Engineering), Maruthakulam official logo', 0, false, 'https://nce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    579, 'https://nce.ac.in/wp-content/uploads/2022/05/stu_03.webp', 'campus',
    'Nellai College of Engineering (Formerly National College of Engineering), Maru official campus image', 0, false, 'https://nce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    580, 'https://nec.edu.in/wp-content/uploads/2025/02/NEW-Logo-2-1-346x129.webp', 'logo',
    'National Engineering College (Autonomous), Kovilpatti, Thoothukudi District official logo', 0, false, 'https://nec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    580, 'https://nec.edu.in/wp-content/uploads/2025/04/newimg.png', 'campus',
    'National Engineering College (Autonomous), Kovilpatti, Thoothukudi District official campus image', 0, false, 'https://nec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    581, 'https://psncet.ac.in/wp-content/uploads/2025/03/a-logo-150x150.png', 'logo',
    'PSN College of Engineering and Technology (Autonomous), Melathediyoor, Tirunelveli-627 official logo', 0, false, 'https://psncet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    585, 'https://src.org.in/wp-content/uploads/2023/03/sardhar-logo-banner-high.png', 'logo',
    'Sardar Raja College of Engineering, Alangulam, Tenkasi District 627808 official logo', 0, false, 'https://src.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    590, 'https://www.gcetly.ac.in/imgs/gcelogo.jpg', 'logo',
    'Government College of Engineering, Tirunelveli District 627007 official logo', 0, false, 'https://www.gcetly.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    591, 'https://drgupopeengg.org/wp-content/uploads/2021/12/logo.png', 'logo',
    'Dr. G U Pope College of Engineering, Sawyerpuram, Thoothukudi District official logo', 0, false, 'https://drgupopeengg.org/',
    'permission_required', 'Official college website', now()
  ),
(
    592, 'https://www.ijce.ac.in/images/infantjesus.webp', 'logo',
    'Infant Jesus College of Engineering, Thoothukudi Highway (NH7/A), Thoothukudi District official logo', 0, false, 'https://www.ijce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    593, 'https://www.ngce.ac.in/wp-content/uploads/2023/08/NCE-A4-Logo_with-2f-no-address-png.png', 'logo',
    'Narayanaguru College of Engineering, Manjalumoodu, Kanyakumari District official logo', 0, false, 'https://www.ngce.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    594, 'http://www.udayaschoolofengineering.com/img/logo.png', 'logo',
    'Udaya School of Engineering, Ammandivilai Post, Kanyakumari District 629204 official logo', 0, false, 'http://www.udayaschoolofengineering.com/',
    'permission_required', 'Official college website', now()
  ),
(
    596, 'https://www.einsteincollege.ac.in/wp-content/uploads/2025/04/einstein-logo.png', 'logo',
    'Einstein College of Engineering, Seethaparpanallur, Tirunelveli District 627012 official logo', 0, false, 'https://www.einsteincollege.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    597, 'https://www.ponjesly.ac.in/wp-content/themes/ponjesly/images/logo/ponjesly-engineering-college-title.jpg', 'logo',
    'Ponjesly College of Engineering, Vettornimadam Post, Nagercoil, Kanyakumari District 6 official logo', 0, false, 'https://www.ponjesly.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    598, 'https://vinsengineeringcollege.org/includes/images/New%20logo.png', 'logo',
    'Vins Christian College of Engineering, Chunkankadai Post, Nagercoil, Kanyakumari Distr official logo', 0, false, 'https://vinsengineeringcollege.org/',
    'permission_required', 'Official college website', now()
  ),
(
    599, 'https://www.ljcet.org/assets/college-ellipse2%20(2).png', 'logo',
    'Lord Jegannath College of Engineering and Technology, Kumarapuram, Thoppur Post, Kanya official logo', 0, false, 'https://www.ljcet.org/',
    'permission_required', 'Official college website', now()
  ),
(
    600, 'https://www.macet.edu.in/img/MacetLogo1.png', 'logo',
    'Marthandam College of Engineering & Technology, Kuttakuzhi, Veeyanoor Post, Kanyakumar official logo', 0, false, 'https://www.macet.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    602, 'http://bethlahem.org/engineering/frontend/web/bethcollege/biefiles/images/bie/logomain.webp', 'logo',
    'Bethlahem Institute of Engineering, Karungal, Kanyakumari District 629157 official logo', 0, false, 'http://bethlahem.org/engineering/frontend/web/index.php/main/index',
    'permission_required', 'Official college website', now()
  ),
(
    604, 'https://www.jpcoe.ac.in/images/College.png', 'logo',
    'J P College of Engineering, College Road, Ayakudy, Tenkasi Taluk, Tenkasi District 627 official logo', 0, false, 'https://www.jpcoe.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    606, 'https://www.srividyaengg.ac.in/img/logo.png', 'logo',
    'Sri Vidya College of Engineering and Technology, Sivakasi Main Road, P Kumaralinapuram official logo', 0, false, 'https://www.srividyaengg.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    609, 'https://www.tce.edu/sites/default/files/2025-02/logo.png', 'logo',
    'Thiagarajar College of Engineering (Autonomous),Tirupparankundram, Madurai District 62 official logo', 0, false, 'https://www.tce.edu/',
    'permission_required', 'Official college website', now()
  ),
(
    615, 'https://www.sriraajaraajan.in/img/logon.png', 'logo',
    'Sri Raajaraajan College of Engineering & Technology, Amaravathi Village, AmaravathiPud official logo', 0, false, 'https://www.sriraajaraajan.in/',
    'permission_required', 'Official college website', now()
  ),
(
    618, 'https://www.kitandkimtechnicalcampus.org/public/images/kim-engg.png', 'logo',
    'Karaikudi Institute of Technology and Karaikudi Institute of Management, KIT & KIM Tec official logo', 0, false, 'https://www.kitandkimtechnicalcampus.org/',
    'permission_required', 'Official college website', now()
  ),
(
    618, 'https://www.kitandkimtechnicalcampus.org/front/images/banners/banner_1636969565.jpg', 'campus',
    'Karaikudi Institute of Technology and Karaikudi Institute of Management, KIT & official campus image', 0, false, 'https://www.kitandkimtechnicalcampus.org/',
    'permission_required', 'Official college website', now()
  ),
(
    619, 'https://mce-madurai.ac.in/wp-content/uploads/2024/09/kalvi-logo.jpg', 'logo',
    'Mangayarkarasi College of Engineering, First Street, Mangayarkarasi Nagar, Paravai, Ma official logo', 0, false, 'https://mce-madurai.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    623, 'https://christianengineering.in/wp-content/uploads/2025/02/CCET-Logo-v1.4.webp', 'logo',
    'Christian College of Engineering and Technology, Oddanchatram, Dindigul District 62461 official logo', 0, false, 'https://christianengineering.in/',
    'permission_required', 'Official college website', now()
  ),
(
    628, 'https://www.rvsetgidgl.ac.in/assets/img/logorvs1.jpg', 'logo',
    'R V S Educational Trust’s Groups of Institutions (Integrated Campus), N Paraipatti Pos official logo', 0, false, 'https://www.rvsetgidgl.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    630, 'https://nscet.org/main_images/College_logo.webp', 'logo',
    'Nadar Saraswathi College of Engineering and Technology, Vadupudupatti, Annanji Post, T official logo', 0, false, 'https://www.nscet.org/',
    'permission_required', 'Official college website', now()
  ),
(
    633, 'https://www.klnce.edu/Academics/images/AcademicsLogo.jpg', 'logo',
    'K L N College of Engineering (Autonomous), Pottapalayam, Sivagangai District official logo', 0, false, 'https://www.klnce.edu/',
    'permission_required', 'Official college website', now()
  ),
(
    634, 'https://www.msec.org.in/images/logo-wide.png', 'logo',
    'Mohamed Sathak Engineering College, Kilakarai, Ramanathapuram District official logo', 0, false, 'https://www.msec.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    634, 'https://www.msec.org.in/images/mlogo.png', 'campus',
    'Mohamed Sathak Engineering College, Kilakarai, Ramanathapuram District official campus image', 0, false, 'https://www.msec.org.in/',
    'permission_required', 'Official college website', now()
  ),
(
    636, 'https://www.ptrcet.edu.in/wp-content/uploads/2023/04/ptr-logo-black-letter-2.png', 'logo',
    'P T R College of Engineering and Technology, Thanapandiyan Nagar, Austinpatty Post, Ma official logo', 0, false, 'https://www.ptrcet.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    637, 'https://www.psyec.edu.in/assets/img/psyec-logo%20100.webp', 'logo',
    'Pandian Saraswathi Yadav Engineering College, Thirumansolai Post, Sivagangai District official logo', 0, false, 'https://www.psyec.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    638, 'https://rvseng.ac.in/wp-content/uploads/2025/08/website-logo-3-copy-scaled-1.png', 'logo',
    'R V S College of Engineering, N Paraipatti Post, Dindigul District 624005 official logo', 0, false, 'https://rvseng.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    640, 'https://www.sacsmec.in/logo.webp', 'logo',
    'SACS-M A V M M Engineering College, Kidaripatty Post, Madurai District official logo', 0, false, 'https://www.sacsmec.in/',
    'permission_required', 'Official college website', now()
  ),
(
    640, 'https://sacsmec.in/social-sacs-mavmm.jpg', 'campus',
    'SACS-M A V M M Engineering College, Kidaripatty Post, Madurai District official campus image', 0, false, 'https://www.sacsmec.in/',
    'permission_required', 'Official college website', now()
  ),
(
    641, 'https://www.smcet.edu.in/assets/images/logo/smcet-logo.png', 'logo',
    'St. Michael College of Engineering and Technology, Kalayarkoil, Sivagangai District 63 official logo', 0, false, 'https://www.smcet.edu.in/',
    'permission_required', 'Official college website', now()
  ),
(
    646, 'https://ucetw.ac.in/wp-content/uploads/2025/09/AICTE-Logo.jpg', 'logo',
    'Ultra College of Engineering and Technology, Kodikulam, 1 Bit Village, Madurai- Chenna official logo', 0, false, 'https://ucetw.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    647, 'https://www.vcet.ac.in/vcetit/images/logos/logo.png', 'logo',
    'Velammal College of Engineering and Technology(Autonomous), Madurai District 625009 official logo', 0, false, 'https://www.vcet.ac.in/',
    'permission_required', 'Official college website', now()
  ),
(
    648, 'https://static.wixstatic.com/media/422024_511b236a449542debe7a2c52620748c6~mv2.png/v1/fill/w_140,h_130,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/college%20logo.png', 'logo',
    'Theni Kammavar Sangam College of Technology, Theni Main Road, Koduvillarpatti Post, Th official logo', 0, false, 'https://www.tksct.in/',
    'permission_required', 'Official college website', now()
  ),
(
    649, 'https://www.lathamathavan.edu.in/wp-content/uploads/2022/04/LMGI-Final-Logo_Print-Media_CMYK-2560.jpg', 'logo',
    'Latha Mathavan Engineering College, Kidaripatti Post, Alagarkoil (Via), Melur Taluk, M official logo', 0, false, 'https://www.lathamathavan.edu.in/',
    'permission_required', 'Official college website', now()
  )
) as candidate (
  college_id, image_url, image_type, caption,
  display_order, is_active, source_url,
  usage_status, attribution, last_verified_at
)
where not exists (
  select 1 from public.college_images existing
  where existing.college_id = candidate.college_id
    and existing.image_url = candidate.image_url
);

commit;
