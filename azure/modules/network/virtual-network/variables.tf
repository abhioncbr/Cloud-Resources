# =========================
# virtual network variables.
variable "tags" {
    type = map
    description = "Tags of a virtual network."
}

variable "location" { 
    type = string
    description = "Location of a virtual network."
}

variable "resource_group_name" {
    type = string
    description = "The name of a resource group "
}

variable "virtual_network_name" {
    type = string
    description = "Name of a virtual network."
}

variable "virtual_address_space" {
    type = list
    description = "Address space of a virtual network."
}

variable "subnet_name" {
    type = string
    description = "Name of a subnet."
}

variable "subnet_address_space" {
    type = string
    description = "Address space of a subnet."
}