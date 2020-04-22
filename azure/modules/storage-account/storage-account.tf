resource "azurerm_storage_account" "storage-account" {
    name                            = var.name
    tags                            = var.tags
    location                        = var.location
    access_tier                     = var.access_tier       
    account_kind                    = var.account_kind
    account_tier                    = var.account_tier
    resource_group_name             = var.resource_group_name
    account_replication_type        = var.account_replication_type
    enable_https_traffic_only       = var.enable_https_traffic_only
    //network_rules {
        //default_action              = var.network_rules.default_action
        //ip_rules                    = var.network_rules.ip_rules
        //virtual_network_subnet_ids  = var.network_rules.virtual_network_subnet_ids
    //}
}