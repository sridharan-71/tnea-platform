export type CategoryKey = "oc" | "bc" | "bcm" | "mbc" | "sc" | "sca" | "st"

export interface BranchHistory {
  year: number
  oc: number | null
  bc: number | null
  bcm: number | null
  mbc: number | null
  sc: number | null
  sca: number | null
  st: number | null
}

export interface DashboardBranch {
  branch_code: string
  branch_name: string
  history: BranchHistory[]
}

export type TrendDirection = "rising" | "falling" | "stable"
