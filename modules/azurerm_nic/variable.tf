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