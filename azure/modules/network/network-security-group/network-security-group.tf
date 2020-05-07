resource "azurerm_network_security_group" "network-security-group" {
    tags                    = var.tags
    location                = var.location
    name                    = var.security_group_name    
    resource_group_name     = var.resource_group_name
}
