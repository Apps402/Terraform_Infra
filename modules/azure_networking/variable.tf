variable "vnet" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        address_space = list(string)
        dns_servers = optional(list(string),[])
        bgp_community = optional(string)
        edge_zone = optional(string)
        flow_timeout_in_minutes = optional(number)
        private_endpoint_vnet_policies = optional(string)
        ddos_protection_plan = optional(list(object({
            id = string
            enable = bool
        })))
        encryption = optional(list(object({
            enforcement = string
        })))
        ip_address_pool = optional(list(object({
            id = string
            number_of_ip_addresses = number

        })))
        subnet = optional(list(object({
            name = string
            address_prefixes = list(string)
            delegation = optional(list(object({
            name = string
            service_delegation = optional(object({
            name = string
        }))
        })))
        })))
        
        
        tags = optional(map(string),{
            owner = "App02"
            team = "Ap01"
        })
    }))
  
}