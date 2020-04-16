# Main virtual network for the demonstration.

variable "tags"                     {}
variable "location"                 {}
variable "app_auth"                 {}
variable "tenant_id"                {}
variable "client_id"                {}
variable "client_secret"            {}
variable "subscription_id"          {}
variable "subscription_provided"    {}
variable "resource_group_name"      {}
variable "virtual_network_name"     {}
variable "virtual_address_space"    {}
variable "subnet_name"              {}
variable "subnet_address_space"     {}


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