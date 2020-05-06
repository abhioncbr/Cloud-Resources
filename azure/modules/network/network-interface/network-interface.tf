resource "azurerm_network_interface" "network-interface" {
    tags                                = var.tags
    location                            = var.location
    resource_group_name                 = var.resource_group_name
    name                                = var.network_interface_name
    ip_configuration {
        name                            = var.ip_configuration.name
        subnet_id                       = var.ip_configuration.subnet_id
        private_ip_address_version      = var.ip_configuration.private_ip_address_version
        private_ip_address_allocation   = var.ip_configuration.private_ip_address_allocation 
    }
}