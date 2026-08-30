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
    'nirf_disclosure', true, 'https://smcoeerp-docs.s3.ap-south-1.amazonaws.com/websitedocs/naac/13/12454?response-content-type=application%2Fpdf&response-content-disposition=inline%3B%20filename%3D%22NIRF2026.pdf%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXMYLEXS5TA6ILDQG%2F20260721%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20260721T050336Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e655d79ffbecfd8cde2e480446418eafdf8ed04caf8ac7e7247f6d92d7846f00', now()
  ),
(
    545, '2023-24', 'ug',
    110, 98, 12,
    192000, null, null,
    'nirf_disclosure', true, 'https://smcoeerp-docs.s3.ap-south-1.amazonaws.com/websitedocs/naac/13/12454?response-content-type=application%2Fpdf&response-content-disposition=inline%3B%20filename%3D%22NIRF2026.pdf%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXMYLEXS5TA6ILDQG%2F20260721%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20260721T050336Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e655d79ffbecfd8cde2e480446418eafdf8ed04caf8ac7e7247f6d92d7846f00', now()
  ),
(
    545, '2024-25', 'ug',
    171, 159, 6,
    219000, null, null,
    'nirf_disclosure', true, 'https://smcoeerp-docs.s3.ap-south-1.amazonaws.com/websitedocs/naac/13/12454?response-content-type=application%2Fpdf&response-content-disposition=inline%3B%20filename%3D%22NIRF2026.pdf%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXMYLEXS5TA6ILDQG%2F20260721%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20260721T050336Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=e655d79ffbecfd8cde2e480446418eafdf8ed04caf8ac7e7247f6d92d7846f00', now()
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
