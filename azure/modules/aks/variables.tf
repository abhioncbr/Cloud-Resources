variable "name" {
    type            = string
    description     = "The name of Azure Kubernetes service"
}

variable "tags" {
    type            = map
    description     = "Tags of a Azure Kubernetes service & Resource Group."
}

variable "location" { 
    type            = string
    description     = "Location of a Azure Kubernetes service."
}

variable "dns_prefix" { 
    type            = string
    description     = "DNS prefix specified when creating the managed cluster."
}

variable "kubernetes_version" { 
    type            = string
    description     = "Version of Kubernetes specified when creating the AKS managed cluster."
}

variable "resource_group_name" {
    type            = string
    description     = "The name of a resource group."
}

variable "http_application_routing" {
    type            = object({
        enabled            = bool
    })    
    description     = "1. enable:  Is HTTP Application Routing Enabled"
}

variable "network_profile" {
    type  = object({
        service_cidr        = string
        network_plugin      = string
        network_policy      = string
        dns_service_ip      = string
        load_balancer_sku   = string
        docker_bridge_cidr  = string
    })   
    description             = <<EOT
                                1. service_cidr:        The Network Range used by the Kubernetes service. \n
                                2. network_plugin:      Network plugin to use for networking. \n
                                3. network_policy:      Sets up network policy to be used with Azure CNI. \n
                                4. dns_service_ip:      IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). \n
                                5. load_balancer_sku:   Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. \n
                                6. docker_bridge_cidr:  IP address (in CIDR notation) used as the Docker bridge IP address on nodes. 
                                EOT
}

variable "default_node_pool" {
    type  = object({
        type                = string
        name                = string
        vm_size             = string
        max_pods            = number
        node_count          = number
        os_disk_size_gb     = string
        vnet_subnet_id      = string
    })
    description             = <<EOT
                                1. type:                The type of Node Pool which should be created.
                                2. name:                The name which should be used for the default Kubernetes Node Pool. 
                                3. vm_size:             The size of the Virtual Machine, such as Standard_DS2_v2.
                                4. max_pods:            The maximum number of pods that can run on each agent.
                                5. node_count:          The initial number of nodes which should exist in this Node Pool.
                                6. os_disk_size_gb:     The size of the OS Disk which should be used for each agent in the Node Pool.
                                7. vnet_subnet_id:      The ID of a Subnet where the Kubernetes Node Pool should exist. 
                                EOT

}                 

variable "service_principal" {
    type  = object({
        client_id           = string
        client_secret       = string
    })
    description             = <<EOT
                                1. client_id:           The Client ID for the Service Principal.
                                2. client_secret:       The Client Secret for the Service Principal.
                                EOT
}
