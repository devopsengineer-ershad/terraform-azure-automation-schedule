variable "automation_schedule" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    automation_account_name = string
    frequency               = string
    interval                = number
    timezone                = string
    start_time              = string
    description             = optional(string)
    week_days               = optional(list(string))
  }))
}


