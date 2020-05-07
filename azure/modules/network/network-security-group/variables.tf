variable "tags" {
    type = map
    description = " A mapping of tags to assign to the resource."
}

variable "location" { 
    type = string
    description = "Specifies the supported Azure location where the resource exists."
}

variable "security_group_name" { 
    type = string
    description = "Specifies the name of the network security group."
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group in which to create the public ip."
}