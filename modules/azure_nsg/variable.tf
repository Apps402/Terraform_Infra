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