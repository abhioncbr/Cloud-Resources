# =========================
# public dns_zone variables.
variable "name" { 
    type = string
    description = "The name of the DNS Zone. Must be a valid domain name."
}

variable "tags" {
    type = map
    description = "A mapping of tags to assign to the resource"
}

variable "resource_group_name" {
    type = string
    description = "Specifies the resource group where the resource exists."
}
