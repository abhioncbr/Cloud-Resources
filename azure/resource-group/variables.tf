# =========================
# active directory app auth
variable "app_auth" {
    type = bool
    description = "[Required]: AD app based authentication for resource creation."
}

# AD app auth variables.
variable "tenant_id" {
    type = string
    description = "[Required if app_auth=true]: Application Id of azure in azure active directory."
}

variable "client_id" {
    type = string
    description = "[Required if app_auth=true]: Client Id for an Application ID."
}

variable "client_secret" {
    type = string
    description = "[Required if app_auth=true]: Client Secret of a Client Id for an Application ID."
}

# =========================
# active directory app auth
variable "subscription_provided" {
    type = bool
    description = "[Required]: subscription id provided for specific subsription."
}

# azurerm provider variables.
variable "subscription_id" {
    type = string
    description = "[Required if subscription_provided=true]: Subscription ID of a azure."
}

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
