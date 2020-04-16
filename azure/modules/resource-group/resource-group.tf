resource "azurerm_resource_group" "resource-group" {
  tags                         = var.tags
  location                     = var.location
  name                         = var.resource_group_name
}
