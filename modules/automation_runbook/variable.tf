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