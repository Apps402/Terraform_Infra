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