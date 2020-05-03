resource "azurerm_dns_zone" "public-dns-zone" {
  name                  = var.name
  tags                  = var.tags
  resource_group_name   = var.resource_group_name
}