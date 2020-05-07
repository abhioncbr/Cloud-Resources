variable "tags" {
    type            = map
    description     = "Tags of a Azure Kubernetes service & Resource Group."
}

variable "location" { 
    type            = string
    description     = "The location where the Network Interface should exist."
}

variable "network_interface_name" {
    type            = string
    description     = "The name of the Network Interface."
}

variable "resource_group_name" {
    type            = string
    description     = "The name of the Resource Group in which to create the Network Interface."
}

variable "ip_configuration" {
    type  = object({
        name                            = string
        subnet_id                       = string
        public_ip_address_id            = string
        private_ip_address_version      = string
        private_ip_address_allocation   = string
    })   
    description                         = <<EOT
                                            1. name:                            A name used for this IP Configuration. \n
                                            2. subnet_id:                       The ID of the Subnet where this Network Interface should be located in. \n
                                            3. public_ip_address_id:            Reference to a Public IP Address to associate with this NIC. \n
                                            4. private_ip_address_version:      The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4. \n
                                            5. private_ip_address_allocation:   The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
                                           EOT
}