variable "keyvault_secrets" {
    type = map(object({
        keyvault_name = string
        rg_name = string
        secret_name = string
        secret_value = string
    }))
  
}