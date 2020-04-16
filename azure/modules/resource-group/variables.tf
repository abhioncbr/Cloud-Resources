# =========================
# resource group variables.
variable "resource_group_name" {
    type = string
    description = "The name of a resource group "
}

variable "location" { 
    type = string
    description = "Location of a resource group"
}

variable "tags" {
    type = map
    description = "Tags of a resource group"
}
