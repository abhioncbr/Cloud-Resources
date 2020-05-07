variable "access" { 
    type = string
    description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
}

variable "priority" { 
    type = number
    description = "Specifies the priority of the rule. The value can be between 100 and 4096."
}

variable "protocol" { 
    type = string
    description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, or *."
}

variable "direction" { 
    type = string
    description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
}

variable "description" { 
    type = string
    description = "A description for this rule. Restricted to 140 characters."
}

variable "source_port_ranges" { 
    type = list
    description = "List of source ports or port ranges. This is required if source_port_range is not specified."
}

variable "resource_group_name" { 
    type = string
    description = "The name of the resource group in which to create the Network Security Rule."
}

variable "destination_port_ranges" { 
    type = list
    description = "List of destination ports or port ranges. This is required if destination_port_range is not specified."
}

variable "source_address_prefixes" { 
    type = list
    description = "List of source address prefixes. This is required if source_address_prefix is not specified."
}    

variable "network_security_rule_name" { 
    type = string
    description = "The name of the security rule."
}

variable "network_security_group_name" { 
    type = string
    description = "The name of the Network Security Group that we want to attach the rule to. "
}

variable "destination_address_prefixes" { 
    type = list
    description = "List of destination address prefixes. This is required if destination_address_prefix is not specified."
}