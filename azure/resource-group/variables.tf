# azurerm provider variables.
variable "subscription_id" {
    type = string
    description = "Subscription ID of a azure"
}

variable "tenant_id" {
    type = string
    description = "Application Id of azure in azure active directory."
}

variable "client_id" {
    type = string
    description = "Client Id for an Application ID."
}

variable "client_secret" {
    type = string
    description = "Client Secret of a Client Id for an Application ID."
}

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
