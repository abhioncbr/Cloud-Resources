# Main virtual network for the demonstration.

# common variables.
variable "tags"                     {}
variable "location"                 {}

# resource manager variables.
variable "app_auth"                 {}
variable "tenant_id"                {}
variable "client_id"                {}
variable "client_secret"            {}
variable "subscription_id"          {}
variable "subscription_provided"    {}

# resource group variables.
variable "resource_group_name"      {}

# virtual network variables.
variable "virtual_network_name"     {}
variable "virtual_address_space"    {}
variable "subnet_name"              {}
variable "subnet_address_space"     {}

# storage account variables.
variable name                       {}
variable access_tier                {}
variable account_kind               {}
variable account_tier               {}
variable account_replication_type   {}
variable enable_https_traffic_only  {}


provider "azurerm" {
    features          {}
    version           = "=2.0.0"
    tenant_id         = var.app_auth ? var.tenant_id : null
    client_id         = var.app_auth ? var.client_id : null
    client_secret     = var.app_auth ? var.client_secret : null
    subscription_id   = var.subscription_provided ? var.subscription_id : null
}

module "local-state-resource-group" {
    tags                        = var.tags
    location                    = var.location
    resource_group_name         = var.resource_group_name
    source                      = "../../modules/resource-group"
}

module "local-state-virtual-network" {
    tags                        = var.tags
    location                    = var.location
    subnet_name                 = var.subnet_name
    subnet_address_space        = var.subnet_address_space
    virtual_network_name        = var.virtual_network_name
    virtual_address_space       = var.virtual_address_space
    source                      = "../../modules/virtual-network"
    resource_group_name         = module.local-state-resource-group.resource_group_name
}

module "local-state-storage-account" {
    name                        = var.name
    tags                        = var.tags
    location                    = var.location
    access_tier                 = var.access_tier
    account_kind                = var.account_kind
    account_tier                = var.account_tier
    source                      = "../../modules/storage-account"
    resource_group_name         = module.local-state-resource-group.resource_group_name

    account_replication_type    = var.account_replication_type
    enable_https_traffic_only   = var.enable_https_traffic_only
    //network_rules               = {
        //"default_action"                = "Deny",
        //"ip_rules"                      = [var.subnet_address_space],
        //"virtual_network_subnet_ids"    = module.local-state-virtual-network.subnet_ids
    //}    
}