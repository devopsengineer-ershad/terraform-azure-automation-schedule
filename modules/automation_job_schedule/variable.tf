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
