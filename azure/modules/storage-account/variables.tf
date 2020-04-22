# =========================
# storage account variables.
variable "name" {
    type = string
    description = "Name of a storage account."
}

variable "tags" {
    type = map
    description = "Tags of a storage account."
}

variable "location" { 
    type = string
    description = "Location of a storage account."
}

variable "access_tier" {
    type = string
    description = "The name of a resource group "
}

variable "account_kind" {
    type = string
    description = "The name of a resource group "
}

variable "account_tier" {
    type = string
    description = "The name of a resource group "
}

variable "resource_group_name" {
    type = string
    description = "The name of a resource group "
}

variable "account_replication_type" {
    type = string
    description = "The name of a resource group "
}

variable "enable_https_traffic_only" {
    type = string
    description = "The name of a resource group "
}

//variable "network_rules" {
//    type  = object({
//        default_action = string
//        //ip_rules = list(string)
//        virtual_network_subnet_ids = list(string)
//    })
//    description = ""
//}
