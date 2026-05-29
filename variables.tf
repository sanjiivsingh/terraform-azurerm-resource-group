variable "rgdetails" {
  description = "Map of Azure Resource Groups"
  type = map(object({
    rg_name  = string
    location = string
    managed_by  = optional(string)
    tags     = optional(map(string))
  }))
}