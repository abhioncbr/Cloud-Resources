resource "azurerm_virtual_network" "virtual-network" {
    tags                        = var.tags
    location                    = var.location
    name                        = var.virtual_network_name
    address_space               = var.virtual_address_space

    subnet {
      name                      = var.subnet_name
      address_prefix            = var.subnet_address_space
    }

    resource_group_name         = var.resource_group_name
}