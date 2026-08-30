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
    395, 'http://www.ckec.ac.in/',
    'https://admissions.dmifoundations.org/christ-the-king-engineering-college', 'http://www.ckec.ac.in/#',
    'http://www.ckec.ac.in/15.Mandatorydisclosures%20-%20Jan%2024%202026.pdf', 'https://ckec.ac.in/ANNAUNIVERSITY/nirf/nirf2026.pdf',
    'mailto:contact@ckec.ac.in', 'pending', 'http://www.ckec.ac.in/', now()
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
    426, 'https://www.srit.org/',
    null, null,
    null, null,
    null, 'pending', 'https://www.srit.org/', now()
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
    'https://hit.edu.in/cdn-cgi/l/email-protection#cbeba3a2bfe5a4adada2a8ae8ba3a2a5afbeb8bfa3aaa5e5a5aebf', 'pending', 'https://hit.edu.in/', now()
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
    483, 'http://ww19.nelliandavar.com/',
    null, null,
    null, null,
    null, 'pending', 'http://ww19.nelliandavar.com/', now()
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
    'https://capstoneplans.com/contact-us/', 'pending', 'https://www.kitandkimtechnicalcampus.org/', now()
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
