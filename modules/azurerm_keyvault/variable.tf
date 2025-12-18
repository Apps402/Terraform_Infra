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