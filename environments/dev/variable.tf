variable "rgs" {
    type = map(object({
        name = string
        location = string
        managed_by = optional(string,"Not assigned")
        tags = optional(map(string),
        {
            owner = "Apps"
            team = "AP"
        })
    }))
  
}


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

variable "keyvault" {
    type = map(object({
        name = string
        location = string
        rg = string
        enabled_for_disk_encryption = optional(bool,true)
        soft_delete_retention_days = optional(number,7)
        purge_protection_enabled = optional(bool,false)
        sku_name = string
        access_policy = list(object({
            key_permissions = list(string)
            secret_permissions = list(string)
            storage_permissions = list(string)
            
    }))

    }))
  
}


variable "keyvault_secrets" {
    type = map(object({
        keyvault_name = string
        rg_name = string
        secret_name = string
        secret_value = string
    }))
  
}


variable "nic" {
    type = map(object({
        sbnet_name = string
        vnet_name = string
        nic_name = string
        nic_loc = string
        rg_name = string
        ip_configuration = map(object({
            name = string
            private_ip_address_allocation = string
        }))
    }))

  
}


variable "vm" {
    type = map(object({
        nic_name = string
        rg_name = string
        key_vault_name = string
        vmname = string
        vm_loc = string
        vmsize = string
        
    }))
  
}

variable "bastion" {
    type = map(object({
        sbnet_name = string
        vnet_name = string
        rg_name = string
        pip_name = string
        pip_loc = string
        bastion_name = string
        bastion_loc = string
        
    }))
  
}


variable "nsg" {
    type = map(object({
        nsg_name = string
        nsg_loc = string
        rg_name = string
        security_rule = optional(list(object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string
        })))
        tags = map(string)
        sbnet_name = string
        vnet_name = string
    }))
  
}