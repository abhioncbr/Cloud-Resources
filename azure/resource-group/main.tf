provider "azurerm" {
    features {}
    version = "=2.0.0"
    tenant_id = var.tenant_id
    client_id = var.client_id
    client_secret = var.client_secret
    subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  tags = var.tags
  location = var.location
  name = var.resource_group_name
}
