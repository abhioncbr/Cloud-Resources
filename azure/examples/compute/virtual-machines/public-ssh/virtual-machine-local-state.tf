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
    source                      = "../../../../modules/resource-group"
}

module "local-state-virtual-network" {
    tags                        = var.tags
    location                    = var.location
    subnet_name                 = var.subnet_name
    subnet_address_space        = var.subnet_address_space
    virtual_network_name        = var.virtual_network_name
    virtual_address_space       = var.virtual_address_space
    source                      = "../../../../modules/network/virtual-network"
    resource_group_name         = module.local-state-resource-group.resource_group_name
}

module "local-state-public-ip" {
    tags                        = var.tags    
    ip_version                  = "IPv4"  
    allocation_method           = "Dynamic"       
    sku                         = "Basic" 
    location                    = var.location
    public_ip_name              = "tf-public-ip"
    source                      = "../../../../modules/network/public-ip"
    resource_group_name         =  module.local-state-resource-group.resource_group_name
}

module "local-state-network-interface" {
    tags                        = var.tags
    location                    = var.location
    network_interface_name      = "tf-network-interface"
    source                      = "../../../../modules/network/network-interface"
    resource_group_name         = module.local-state-resource-group.resource_group_name

    ip_configuration            = {
        "private_ip_address_version"      = "IPv4"
        "private_ip_address_allocation"   = "Dynamic"
        "name"                            = "tf-net-inter"
        "subnet_id"                       = module.local-state-virtual-network.subnet_ids[0]
        "public_ip_address_id"            = module.local-state-public-ip.public_ip_id        
    }    
}

module "local-state-virtual-machine" {
    tags                                = var.tags
    size                                = "Standard_F2"
    location                            = var.location
    admin_username                      = "azure_user"
    virtual_machine_name                = "tf-virtual-machine"

    source                              = "../../../../modules/compute/virtual-machine"
    network_interface_ids               = [module.local-state-network-interface.network_interface_id]   
    resource_group_name                 = module.local-state-resource-group.resource_group_name

    admin_ssh_key                       = { 
        "username"                        = "azure_user"
        "public_key"                      = file("~/.ssh/azure_user.pub")
    }  

    os_disk                             = {
        "name"                            = "tf-virtual-machine-os-disk"
        "caching"                         = "ReadWrite"
        "disk_size_gb"                    = 100
        "storage_account_type"            = "Standard_LRS"
    }

    source_image_reference             = {
        "sku"                            = "18.04-LTS"
        "offer"                          = "UbuntuServer"
        "version"                        = "latest" 
        "publisher"                      = "Canonical"
    }  
}