output "storage_account_name" {
  value             = azurerm_storage_account.storage-account.name
  description       = "Terraform created azure storage account name."
}

output "storage_account_id" {
  value             = azurerm_storage_account.storage-account.id
  description       = "Terraform created azure storage account id."
}