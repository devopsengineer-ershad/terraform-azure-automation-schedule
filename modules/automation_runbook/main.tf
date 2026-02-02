resource "azurerm_automation_runbook" "automation_runbook" {
    for_each = var.automation_runbook
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  automation_account_name = each.value.automation_account_name
  log_verbose             = each.value.log_verbose
  log_progress            = each.value.log_progress
  description             = each.value.description
  runbook_type            = each.value.runbook_type

  content = file("${path.root}/${each.value.script_path}")
}