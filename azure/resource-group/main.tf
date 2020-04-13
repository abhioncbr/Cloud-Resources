provider "azurerm" {
    features {}
    version = "=2.0.0"
    tenant_id = var.app_auth ? var.tenant_id : null
    client_id = var.app_auth ? var.client_id : null
    client_secret = var.app_auth ? var.client_secret : null
    subscription_id = var.subscription_provided ? var.subscription_id : null
}

resource "azurerm_resource_group" "rg" {
  tags = var.tags
  location = var.location
  name = var.resource_group_name
}
