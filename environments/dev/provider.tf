terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "c2030b51-2f02-4c24-9532-07a55f218345"
}