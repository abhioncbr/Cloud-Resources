provider "azurerm" {
    version                     = "~> 2.0.0"
    features                    {}
}

resource "azurerm_resource_group" "virtual-network" {
    source                      = "../resource-group"
    
}

resource "azurerm_virtual_network" "virtual-network" {
    name                        = var.name
    location                    = azurerm_resource_group.network.location
    resource_group_name         = azurerm_resource_group.network.name
    address_space               = var.address_space
    dns_servers                 = var.dns_servers

  subnet {
    name                        = var.subnet_name
    address_prefix              = var.subnet_address_space
  }
}