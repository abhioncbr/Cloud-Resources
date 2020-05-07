resource "azurerm_network_security_rule" "network-security-rule" {
    access                          = var.access
    priority                        = var.priority    
    protocol                        = var.protocol
    direction                       = var.direction    
    description                     = var.description    
    source_port_ranges              = var.source_port_ranges
    resource_group_name             = var.resource_group_name    
    destination_port_ranges         = var.destination_port_ranges
    source_address_prefixes         = var.source_address_prefixes
    name                            = var.network_security_rule_name
    network_security_group_name     = var.network_security_group_name
    destination_address_prefixes    = var.destination_address_prefixes
}