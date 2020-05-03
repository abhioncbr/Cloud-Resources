# Main resource group for the demonstration.

variable "tags"                     {}
variable "location"                 {}
variable "app_auth"                 {}
variable "tenant_id"                {}
variable "client_id"                {}
variable "client_secret"            {}
variable "subscription_id"          {}
variable "subscription_provided"    {}
variable "resource_group_name"      {}
variable "name"                     {}


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

module "local-state-public-dns-zone" {
    name                        = var.name
    tags                        = var.tags
    source                      = "../../modules/dns-zone/public"
    resource_group_name         = module.local-state-resource-group.resource_group_name
}