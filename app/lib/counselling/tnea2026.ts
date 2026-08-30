export type CounsellingStageId =
  | "rank_ready"
  | "waiting_round"
  | "choice_filling"
  | "allotment"
  | "confirmation"
  | "upward"
  | "reporting"
  | "joined";

export type CounsellingPathway = "academic" | "government_75" | "vocational" | "special";
export type CounsellingRound = "1" | "2" | "3" | "not_sure";

export interface CounsellingStage {
  id: CounsellingStageId;
  shortLabel: string;
  title: string;
  summary: string;
  nextAction: string;
  deadlineRule: string;
  missedConsequence: string;
  checklist: Array<{ id: string; label: string }>;
}

export const OFFICIAL_PROCEDURE_URL =
  "https://static.tneaonline.org/docs/8_TNEA_2024_Counselling_procedure_2026.pdf?t=1781136000024";
export const OFFICIAL_SCHEDULE_URL =
  "https://static.tneaonline.org/docs/TNEA_Tentative_Schedule_2026.pdf?t=1782888351207";
export const OFFICIAL_PORTAL_URL = "https://www.tneaonline.org/";
export const EXPLAINER_VIDEO_URL = "https://www.youtube.com/watch?v=yaqrwFWo9rw";
export const VERIFIED_ON = "23 July 2026";

export const PATHWAY_LABELS: Record<CounsellingPathway, string> = {
  academic: "General academic",
  government_75: "Government school 7.5%",
  vocational: "Vocational",
  special: "Special reservation",
};

export const GENERAL_ACADEMIC_ROUND_SCHEDULE = {
  "1": {
    rank: "1–37,976",
    cutoff: "171.333–200",
    choice: "20–22 July 2026",
    choiceStart: "2026-07-20",
    choiceEnd: "2026-07-22",
    tentative: "24 July 2026",
    confirm: "24 July 2026, 10:00 AM–5:00 PM",
    reporting: "26–30 July 2026",
    upward: "3 August 2026",
  },
  "2": {
    rank: "37,977–131,093",
    cutoff: "135.75–171",
    choice: "3–5 August 2026",
    choiceStart: "2026-08-03",
    choiceEnd: "2026-08-05",
    tentative: "7 August 2026",
    confirm: "7 August 2026, 10:00 AM–5:00 PM",
    reporting: "9–13 August 2026",
    upward: "17 August 2026",
  },
  "3": {
    rank: "131,094–233,812",
    cutoff: "77.500–135.5",
    choice: "17–19 August 2026",
    choiceStart: "2026-08-17",
    choiceEnd: "2026-08-19",
    tentative: "21 August 2026",
    confirm: "21 August 2026, 10:00 AM–5:00 PM",
    reporting: "23–27 August 2026",
    upward: "31 August 2026",
  },
} as const;

export const PROCESS_STAGES: CounsellingStage[] = [
  {
    id: "rank_ready",
    shortLabel: "Rank ready",
    title: "Rank published",
    summary: "Your eligible TNEA rank is available. Confirm that every detail is correct before counselling.",
    nextAction: "Download your rank details and verify your name, marks, community and reservation information.",
    deadlineRule: "The 2026 grievance window was 1–6 July.",
    missedConsequence: "An incorrect rank-list detail left unreported can affect counselling eligibility or allotment.",
    checklist: [
      { id: "rank_downloaded", label: "I downloaded or saved my rank details" },
      { id: "details_checked", label: "I checked my name, marks, community and special reservation details" },
      { id: "round_identified", label: "I know which counselling pathway and round apply to me" },
    ],
  },
  {
    id: "waiting_round",
    shortLabel: "Waiting",
    title: "Waiting for your counselling round",
    summary: "Use this time to prepare a broad, correctly ordered set of college–branch choices.",
    nextAction: "Check your portal dashboard regularly and prepare choices before your personal window opens.",
    deadlineRule: "General counselling runs from 20 July to 30 August 2026; your personal dates depend on your round.",
    missedConsequence: "Waiting until the choice-filling window opens can lead to rushed ordering and missing safer options.",
    checklist: [
      { id: "portal_checked", label: "I checked my TNEA dashboard for my round" },
      { id: "preferences_ready", label: "I wrote down my college, branch and location priorities" },
      { id: "evidence_reviewed", label: "I reviewed Reach, Target, Safe and Very Safe colleges" },
      { id: "documents_ready", label: "My application, certificates and login details are safely available" },
    ],
  },
  {
    id: "choice_filling",
    shortLabel: "Choice filling",
    title: "Choice filling stage",
    summary: "The order is decisive. TNEA permits any number of choices during the three-day choice-filling stage.",
    nextAction: "Enter choices in your true preference order, review every row and complete the official submission in time.",
    deadlineRule: "Official procedure: three days for choice filling. Follow the exact dates shown in your TNEA login.",
    missedConsequence: "Choices not completed within your official window cannot be considered for that round.",
    checklist: [
      { id: "ambitious_added", label: "I included ambitious choices above my expected range" },
      { id: "realistic_added", label: "I included enough realistic and safer choices" },
      { id: "order_reviewed", label: "Every choice is in my genuine preference order" },
      { id: "codes_checked", label: "I checked every college and branch code" },
      { id: "portal_saved", label: "I saved and rechecked the final list on the official portal" },
    ],
  },
  {
    id: "allotment",
    shortLabel: "Allotment",
    title: "Allotment result published",
    summary: "Read the allotted college–branch and its position in your list before selecting a confirmation option.",
    nextAction: "Download the result, compare it with the higher choices still available and read all six official options.",
    deadlineRule: "The confirmation window follows allotment and lasts two days.",
    missedConsequence: "Doing nothing can cause loss of the allotted seat and movement to the next round.",
    checklist: [
      { id: "result_saved", label: "I downloaded or saved the allotment result" },
      { id: "choice_position", label: "I found the allotted option’s position in my submitted list" },
      { id: "higher_choices", label: "I reviewed the higher choices that remain relevant" },
      { id: "options_read", label: "I read the consequence of all confirmation options" },
    ],
  },
  {
    id: "confirmation",
    shortLabel: "Confirm",
    title: "Confirmation required",
    summary: "Choose one of the official confirmation options only after understanding what it preserves or gives up.",
    nextAction: "Select the appropriate option inside your TNEA login before the displayed deadline and save proof.",
    deadlineRule: "Official procedure: confirm within two days from allotment.",
    missedConsequence: "Non-confirmation leads to loss of the allotted seat and movement to the next round.",
    checklist: [
      { id: "family_decision", label: "The student and family agree on the decision" },
      { id: "consequence_understood", label: "I understand whether the current seat is kept or declined" },
      { id: "option_submitted", label: "I submitted the option on the official portal" },
      { id: "proof_saved", label: "I saved the confirmation or allotment document" },
    ],
  },
  {
    id: "upward",
    shortLabel: "Upward",
    title: "Waiting for upward movement",
    summary: "Upward movement considers only choices placed above the current allotment.",
    nextAction: "Follow the tentative allotment instructions, report to the specified TFC and pay fees when required.",
    deadlineRule: "Use the reporting date printed on your tentative allotment order.",
    missedConsequence: "Failure to report or pay when required can cancel the current allotment and end further participation.",
    checklist: [
      { id: "tentative_order", label: "I downloaded the tentative allotment order" },
      { id: "tfc_identified", label: "I identified the correct TFC and reporting date" },
      { id: "fee_rule_checked", label: "I checked whether a payment or concession applies" },
      { id: "reported_upward", label: "I completed TFC reporting and saved proof" },
    ],
  },
  {
    id: "reporting",
    shortLabel: "Reporting",
    title: "Report for admission",
    summary: "Your seat is not complete until you follow the allotment order, report and finish the required payment.",
    nextAction: "Download the provisional order and report to the allotted college before the printed deadline.",
    deadlineRule: "The official process diagram allows a five-day joining/payment window; obey the date on your order.",
    missedConsequence: "Non-reporting or non-payment cancels the allotment and can end participation in later rounds.",
    checklist: [
      { id: "provisional_order", label: "I downloaded the provisional allotment order" },
      { id: "college_contacted", label: "I verified the college reporting location and timing" },
      { id: "originals_ready", label: "I prepared the required originals, copies and photographs" },
      { id: "fees_ready", label: "I confirmed the payment amount, method and concessions" },
      { id: "reported_college", label: "I reported to the college and saved every receipt" },
    ],
  },
  {
    id: "joined",
    shortLabel: "Joined",
    title: "Admission completed",
    summary: "Keep all orders, receipts and submitted-document acknowledgements safely.",
    nextAction: "Verify the college’s orientation date, document-return policy and any remaining official requirements.",
    deadlineRule: "No active TNEA action is shown after successful reporting.",
    missedConsequence: "Keep checking official college communication so you do not miss institution-level joining steps.",
    checklist: [
      { id: "receipts_saved", label: "I saved fee receipts and admission acknowledgement" },
      { id: "documents_recorded", label: "I recorded which originals were submitted" },
      { id: "joining_info", label: "I know the orientation or class commencement date" },
    ],
  },
];

export const OFFICIAL_MILESTONES = [
  { label: "Registration opened", date: "3 May 2026", status: "completed" },
  { label: "Registration deadline", date: "5 June 2026", status: "completed" },
  { label: "Document upload deadline", date: "6 June 2026", status: "completed" },
  { label: "Random number", date: "10 June 2026", status: "completed" },
  { label: "Certificate verification", date: "8–29 June 2026", status: "completed" },
  { label: "Rank list", date: "1 July 2026", status: "completed" },
  { label: "Grievance redressal", date: "1–6 July 2026", status: "completed" },
  { label: "Special reservation counselling", date: "13–18 July 2026", status: "completed" },
  { label: "General counselling", date: "20 July–30 August 2026", status: "active" },
] as const;

export const CONFIRMATION_OPTIONS = [
  {
    title: "Accept and Join",
    keepsSeat: true,
    description: "Keep the allotted seat, download the provisional order and report to the college.",
    warning: "Not reporting or paying within the order’s deadline cancels the seat and ends later-round participation.",
  },
  {
    title: "Accept and Upward",
    keepsSeat: true,
    description: "Temporarily keep the allotment while waiting only for choices placed above it.",
    warning: "You must follow the tentative order, report to the TFC and pay when required.",
  },
  {
    title: "Decline and Upward",
    keepsSeat: false,
    description: "Give up the current seat and wait for a higher choice during upward movement.",
    warning: "If no higher choice is available, you move to the next round without the declined seat.",
  },
  {
    title: "Decline and move to next round",
    keepsSeat: false,
    description: "Give up the current seat, skip upward movement and participate in the next round.",
    warning: "The current allotment is not protected.",
  },
  {
    title: "Decline and Quit",
    keepsSeat: false,
    description: "Give up the current allotment and leave subsequent counselling.",
    warning: "Use only when you are certain you no longer want to participate.",
  },
  {
    title: "Upward or move to next round",
    keepsSeat: false,
    description: "Shown when no seat was allotted. Wait for upward movement, then continue to the next round if needed.",
    warning: "This option does not protect a seat because no seat has been allotted yet.",
  },
] as const;
