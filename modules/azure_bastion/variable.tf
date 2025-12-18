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