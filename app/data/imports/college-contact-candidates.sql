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
