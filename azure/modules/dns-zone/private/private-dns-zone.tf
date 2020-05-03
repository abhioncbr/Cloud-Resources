resource "azurerm_private_dns_zone" "private-dns-zone" {
  name                  = var.name
  tags                  = var.tags
  resource_group_name   = var.resource_group_name
}