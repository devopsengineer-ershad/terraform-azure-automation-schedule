variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "automation_account" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    tags                = optional(map(string))
  }))
}

variable "automation_runbook" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    automation_account_name = string
    log_verbose             = optional(bool)
    log_progress            = optional(bool)
    description             = optional(string)
    runbook_type            = string
    script_path             = string
  }))
}

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

variable "job_schedule" {
  description = "Automation job schedules with runbook parameters"
  type = map(object({
    automation_account_name = string
    resource_group_name     = string
    runbook_name            = string
    schedule_name           = string

    parameters = map(string)
  }))
}