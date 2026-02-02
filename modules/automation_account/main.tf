resource "azurerm_automation_account" "automation_account" {
    for_each = var.automation_account
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name

  tags = each.value.tags
}