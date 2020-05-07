variable "sku" {
    type = string
    description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
}

variable "tags" {
    type = map
    description = " A mapping of tags to assign to the resource."
}

variable "location" { 
    type = string
    description = "Specifies the supported Azure location where the resource exists."
}

variable "ip_version" { 
    type = string
    description = "The IP Version to use, IPv6 or IPv4."
}

variable "public_ip_name" { 
    type = string
    description = "Specifies the name of the Public IP resource."
}

variable "allocation_method" { 
    type = string
    description = "Defines the allocation method for this IP address."
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group in which to create the public ip."
}
