output "resource_group_name" {
  value           = azurerm_resource_group.resource-group.name
  description     = "Terraform created azure resource group name."
}

output "resource_group_id" {
  value           = azurerm_resource_group.resource-group.id
  description     = "Terraform created azure resource group id."
}