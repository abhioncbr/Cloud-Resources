# =========================
variable "tags" {
    type            = map
    description     = "A mapping of tags which should be assigned to this Virtual Machine"
}

variable "size" {
    type            = string
    default         = "Standard_F2"
    description     = "The SKU which should be used for this Virtual Machine, such as Standard_F2"
}

variable "location" { 
    type            = string
    description     = "The Azure location where the Linux Virtual Machine should exist."
}

variable "admin_username" { 
    type            = string
    description     = "The username of the local administrator used for the Virtual Machine."
}

variable "resource_group_name" {
    type            = string
    description     = "The name of the Resource Group in which the Linux Virtual Machine should be exist."
}

variable "virtual_machine_name" {
    type            = string
    description     = "The name of the Linux Virtual Machine. Changing this forces a new resource to be created."
}

variable "network_interface_ids" {
    type            = list
    description     = "TA list of Network Interface ID's which should be attached to this Virtual Machine."
}

variable "admin_ssh_key" {
    type  = object({
        public_key              = string
    })
    description                 = <<EOT
                                    1. public_key: The Public Key which should be used for authentication, which needs to be at least 2048-bit and in ssh-rsa format.
                                    EOT
}

variable "source_image_reference" {
    type  = object({
        sku                     = string
        offer                   = string
        version                 = string
        publisher               = string
    })
    description                 = <<EOT
                                    1. sku:         An instance of an offer, such as a major release of a distribution. Examples: 18.04-LTS. \n
                                    2. offer:       The name of a group of related images created by a publisher. \n
                                    3. version:     The version number of an image SKU. \n
                                    4. publisher:   The organization that created the image.
                                    EOT
}

variable "os_disk" {
    type  = object({
        name                    = string
        caching                 = string
        disk_size_gb            = string
        storage_account_type    = string
    })
    description             = <<EOT
                                1. name:                    The name which should be used for the Internal OS Disk.
                                2. caching:                 The Type of Caching which should be used for the Internal OS Disk.
                                3. disk_size_gb:            The Size of the Internal OS Disk in GB.    
                                4. storage_account_type:    The Type of Storage Account which should back this the Internal OS Disk.
                                EOT
}