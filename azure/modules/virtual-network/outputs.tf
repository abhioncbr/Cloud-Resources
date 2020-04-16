output "virtual_network_name" {
  value             = azurerm_virtual_network.virtual-network.name
  description       = "Terraform created azure virtual network name."
}

output "virtual_network_id" {
  value             = azurerm_virtual_network.virtual-network.id
  description       = "Terraform created azure virtual network id."
}