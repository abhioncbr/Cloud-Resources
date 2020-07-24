# Main virtual network for the demonstration.

# common variables.
variable "tags"                     {}
variable "location"                 {}

# resource manager variables.
variable "tenant_id"                {}
variable "client_id"                {}
variable "client_secret"            {}
variable "subscription_id"          {}

# resource group variables.
variable "resource_group_name"      {}

# virtual network variables.
variable "virtual_network_name"     {}
variable "virtual_address_space"    {}
variable "subnet_name"              {}
variable "subnet_address_space"     {}

# storage account variables.
variable name                       {}
variable type                       {}
variable vm_size                    {}
variable dns_prefix                 {}
variable service_cidr               {}
variable network_policy             {}
variable dns_service_ip             {}
variable load_balancer_sku          {}
variable docker_bridge_cidr         {}
variable kubernetes_version         {}
variable http_application_routing_enabled   {}


provider "azurerm" {
    features          {}
    version           = "=2.0.0"
    tenant_id         = var.tenant_id
    client_id         = var.client_id
    client_secret     = var.client_secret
    subscription_id   = var.subscription_id
}

module "local-state-resource-group" {
    tags                        = var.tags
    location                    = var.location
    resource_group_name         = var.resource_group_name
    source                      = "../../../modules/resource-group"
}

module "local-state-virtual-network" {
    tags                        = var.tags
    location                    = var.location
    subnet_name                 = var.subnet_name
    subnet_address_space        = var.subnet_address_space
    virtual_network_name        = var.virtual_network_name
    virtual_address_space       = var.virtual_address_space
    source                      = "../../../modules/network/virtual-network"
    resource_group_name         = module.local-state-resource-group.resource_group_name
}

module "local-state-aks-cluster" {
    name                        = var.name
    tags                        = var.tags
    location                    = var.location
    dns_prefix                  = var.dns_prefix
    source                      = "../../../modules/aks"
    kubernetes_version          = var.kubernetes_version

    network_profile         = {
        "service_cidr"        = var.service_cidr,
        "network_plugin"      = "azure",
        "network_policy"      = var.network_policy,
        "dns_service_ip"      = var.dns_service_ip,
        "load_balancer_sku"   = var.load_balancer_sku,
        "docker_bridge_cidr"  = var.docker_bridge_cidr
    }

    default_node_pool       = {
        "type"                = var.type
        "name"                = "nodepool"
        "vm_size"             = var.vm_size
        "max_pods"            = 30
        "node_count"          = 3
        "os_disk_size_gb"     = 128
        "vnet_subnet_id"      = module.local-state-virtual-network.subnet_ids[0]
    }

    service_principal           = {
        "client_id"             = var.client_id,
        "client_secret"         = var.client_secret
    }

    http_application_routing    = {
        "enabled"               = var.http_application_routing_enabled
    }

    resource_group_name         = module.local-state-resource-group.resource_group_name
}