resource "azurerm_public_ip" "public-ip" {
    sku                     = var.sku
    tags                    = var.tags
    location                = var.location
    ip_version              = var.ip_version
    name                    = var.public_ip_name    
    allocation_method       = var.allocation_method    
    resource_group_name     = var.resource_group_name
}