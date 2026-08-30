export const COMMUNITY_OPTIONS = [
  { value: "oc", label: "OC" }, { value: "bc", label: "BC" },
  { value: "bcm", label: "BCM" }, { value: "mbc", label: "MBC / DNC" },
  { value: "sc", label: "SC" }, { value: "sca", label: "SCA" },
  { value: "st", label: "ST" },
] as const;

export type CommunityKey = (typeof COMMUNITY_OPTIONS)[number]["value"];
export const RECOMMENDATION_MODES = [
  { value: "balanced", label: "Preference order", description: "Keep your selected branch and district order; admission evidence is shown separately." },
] as const;
export type RecommendationMode = (typeof RECOMMENDATION_MODES)[number]["value"];

export const EXCLUSION_OPTIONS = [
  { value: "women_only", label: "Women-only colleges" },
  { value: "minority", label: "Minority institutions" },
  { value: "no_hostel", label: "Colleges without verified hostel availability" },
] as const;
export type CollegeExclusion = (typeof EXCLUSION_OPTIONS)[number]["value"];
export interface BranchPreference { code: string; name: string }
export type RankStatus = "known" | "not_published" | "unknown";
export type LocationFlexibility = "selected_only" | "statewide_alternatives" | "anywhere";
export type LivingArrangement = "day_scholar" | "hostel_required" | "hostel_preferred" | "either";
export type ChoiceOrderingStrategy = "college_first" | "balanced" | "branch_first";
export interface StudentProfile {
  name: string; cutoff: number; rank: number | null; rankStatus: RankStatus; community: CommunityKey | "";
  preferredDistricts: string[]; preferredBranches: string[];
  locationFlexibility: LocationFlexibility; livingArrangement: LivingArrangement;
  choiceOrderingStrategy: ChoiceOrderingStrategy;
  recommendationMode: RecommendationMode; excludedCollegeTraits: CollegeExclusion[];
}
export type StudentProfileErrors = Partial<Record<keyof StudentProfile, string>>;
export const DEFAULT_STUDENT_PROFILE: StudentProfile = {
  name: "", cutoff: 0, rank: null, rankStatus: "unknown", community: "", preferredDistricts: [], preferredBranches: [],
  locationFlexibility: "statewide_alternatives", livingArrangement: "either",
  choiceOrderingStrategy: "college_first",
  recommendationMode: "balanced", excludedCollegeTraits: [],
};
export const BRANCH_OPTIONS: BranchPreference[] = [
  { code: "CS", name: "Computer Science and Engineering" },
  { code: "IT", name: "Information Technology" },
  { code: "AD", name: "Artificial Intelligence and Data Science" },
  { code: "AM", name: "Artificial Intelligence and Machine Learning" },
  { code: "CB", name: "Computer Science and Business Systems" },
  { code: "CY", name: "Computer Science and Engineering (Cyber Security)" },
  { code: "CD", name: "Computer Science and Design" },
  { code: "EC", name: "Electronics and Communication Engineering" },
  { code: "EE", name: "Electrical and Electronics Engineering" },
  { code: "ME", name: "Mechanical Engineering" },
  { code: "CE", name: "Civil Engineering" },
  { code: "BT", name: "Biotechnology" },
];
export const TAMIL_NADU_DISTRICTS = [
  "Anywhere in Tamil Nadu",
  "Ariyalur", "Chengalpattu", "Chennai", "Coimbatore", "Cuddalore",
  "Dharmapuri", "Dindigul", "Erode", "Kallakurichi", "Kancheepuram",
  "Kanniyakumari", "Karur", "Krishnagiri", "Madurai", "Mayiladuthurai",
  "Nagapattinam", "Namakkal", "Nilgiris", "Perambalur", "Pudukkottai",
  "Ramanathapuram", "Ranipet", "Salem", "Sivagangai", "Tenkasi",
  "Thanjavur", "Theni", "Thoothukudi", "Tiruchirappalli", "Tirunelveli",
  "Tirupathur", "Tiruppur", "Tiruvallur", "Tiruvannamalai", "Tiruvarur",
  "Vellore", "Viluppuram", "Virudhunagar",
] as const;
