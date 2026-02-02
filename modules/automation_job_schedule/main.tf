resource "azurerm_automation_job_schedule" "job_schedule" {
  for_each = var.job_schedule

  automation_account_name = each.value.automation_account_name
  resource_group_name     = each.value.resource_group_name
  runbook_name            = each.value.runbook_name
  schedule_name           = each.value.schedule_name

  parameters = each.value.parameters
}