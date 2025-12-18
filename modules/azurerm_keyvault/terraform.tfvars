keyvault = {
  keyvault1 = {
    name = "Apvault00199900001"
    location = "West US"
    rg  = "Appsrg01"
    sku_name = "standard"
    access_policy = [
        {
        key_permissions = ["Get","List"]
        secret_permissions = ["Get","Set","List"]
        storage_permissions = ["Get","Set","List"]
        }
    ]
    
  }
}