variable "automation_account" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    tags                = optional(map(string))
  }))
}