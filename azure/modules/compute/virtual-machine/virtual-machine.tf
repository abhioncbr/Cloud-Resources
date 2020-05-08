resource "azurerm_linux_virtual_machine" "linux-virtual-machine" {
        tags                        = var.tags
        size                        = var.size
        location                    = var.location
        admin_username              = var.admin_username
        resource_group_name         = var.resource_group_name
        name                        = var.virtual_machine_name
        network_interface_ids       = var.network_interface_ids     # array of network_interface_ids
        

        admin_ssh_key {
            username                = var.admin_username
            public_key              = var.admin_ssh_key.public_key  #file("~/.ssh/id_rsa.pub")
        }

        os_disk {
            name                    = var.os_disk.name
            caching                 = var.os_disk.caching
            disk_size_gb            = var.os_disk.disk_size_gb
            storage_account_type    = var.os_disk.storage_account_type
        }

        source_image_reference {
            sku                     = var.source_image_reference.sku          
            offer                   = var.source_image_reference.offer        
            version                 = var.source_image_reference.version                         
            publisher               = var.source_image_reference.publisher
        }
}