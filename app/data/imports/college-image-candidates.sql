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
    395, 'http://www.ckec.ac.in/images/Header%20after%20NAAC_1%20(1).jpg', 'logo',
    'Christ The King Engineering College, Cecilia Gardens, Chikkarampalayam Village, Coimba official logo', 0, false, 'http://www.ckec.ac.in/',
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
