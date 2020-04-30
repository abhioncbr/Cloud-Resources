resource "azurerm_kubernetes_cluster" "aks-cluster" {
    name                    = var.name
    tags                    = var.tags
    location                = var.location
    dns_prefix              = var.dns_prefix  
    kubernetes_version      = var.kubernetes_version
    resource_group_name     = var.resource_group_name
    
    network_profile     {
        network_plugin          = var.network_profile.network_plugin
        service_cidr            = var.network_profile.service_cidr 
        network_policy          = var.network_profile.network_policy      
        dns_service_ip          = var.network_profile.dns_service_ip
        load_balancer_sku       = var.network_profile.load_balancer_sku
        docker_bridge_cidr      = var.network_profile.docker_bridge_cidr
    }

    default_node_pool   {
        type                    = var.default_node_pool.type
        name                    = var.default_node_pool.name
        vm_size                 = var.default_node_pool.vm_size
        max_pods                = var.default_node_pool.max_pods
        node_count              = var.default_node_pool.node_count
        os_disk_size_gb         = var.default_node_pool.os_disk_size_gb
        vnet_subnet_id          = var.default_node_pool.vnet_subnet_id
    }

    service_principal {
        client_id               = var.service_principal.client_id
        client_secret           = var.service_principal.client_secret
    }

    addon_profile    {
        http_application_routing    {
            enabled             = var.http_application_routing.enabled
        }
    }

        client_id           = var.service_principal.client_id
        client_secret       = var.service_principal.client_secret
    }
}