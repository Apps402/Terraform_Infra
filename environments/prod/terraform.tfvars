rgs = {
  rg1 = {
    name = "Appsrg01prod"
    location = "West US"
    managed_by = "Infra"
    tags = {
        owner = "App01"
        team = "Ap01"
    }
  }
}

vnet = {
  vnet1 = {
    name = "Apvnetprod"
    location = "West US"
    resource_group_name = "Appsrg01prod"
    address_space = ["10.0.0.0/16"]
   

    subnet = [{
      address_prefixes = ["10.0.1.0/24"]
      name = "subnet1"
    },
    {
      address_prefixes = ["10.0.2.0/24"]
      name = "subnet2"
    },
    {
      address_prefixes = ["10.0.3.0/24"]
      name = "AzureBastionSubnet"
    }
    ]
    tags = {
        owner = "Apps03"
        team = "Ap03"
    }
  }
}

keyvault = {
  keyvault1 = {
    name = "Apvault00199900001"
    location = "West US"
    rg  = "Appsrg01"
    sku_name = "standard"
    access_policy = [
        {
        key_permissions = ["Get","List","Delete"]
        secret_permissions = ["Get","Set","List","Delete"]
        storage_permissions = ["Get","Set","List","Delete"]
        }
    ]
    
  }
}


keyvault_secrets = {
  keyvault_secret1 = {
    keyvault_name = "Apvault00199900001"
    rg_name = "Appsrg01"
    secret_name = "vmusername"
    secret_value = "devops123"
    
  }
  keyvault_secret2 = {
    keyvault_name = "Apvault00199900001"
    rg_name = "Appsrg01"
    secret_name = "vmpwd"
    secret_value = "devops@123"
    
  }

  keyvault_secret3 = {
    keyvault_name = "Apvault00199900001"
    rg_name = "Appsrg01"
    secret_name = "sqlusername"
    secret_value = "devopsql12300"
    
  }

  keyvault_secret4 = {
    keyvault_name = "Apvault00199900001"
    rg_name = "Appsrg01"
    secret_name = "sqlpwd"
    secret_value = "devops@sql123"
    
  }
}


nic ={
    nic1 ={
        sbnet_name = "subnet1"
        vnet_name = "Apvnet"
        nic_name = "apnic"
        nic_loc = "West US"
        rg_name = "Appsrg01"
        ip_configuration ={
            ip1 ={
                name = "internal"
                private_ip_address_allocation = "Dynamic"
            }
        }
    }

    nic2 ={
        sbnet_name = "subnet2"
        vnet_name = "Apvnet"
        nic_name = "apnic2"
        nic_loc = "West US"
        rg_name = "Appsrg01"
        ip_configuration ={
            ip1 ={
                name = "internal"
                private_ip_address_allocation = "Dynamic"
            }
        }
    }
}


vm = {
    vm01 ={
        nic_name = "apnic"
        rg_name = "Appsrg01"
        key_vault_name = "Apvault00199900001"
        vmname = "apvmfeprod"
        vm_loc = "West US"
        vmsize = "Standard_B1s"
    }
    vm02 ={
        nic_name = "apnic2"
        rg_name = "Appsrg01"
        key_vault_name = "Apvault00199900001"
        vmname = "apvmbe"
        vm_loc = "West US"
        vmsize = "Standard_B1s"
    }
}


bastion = {
  bastion1 = {
     sbnet_name = "AzureBastionSubnet"
     vnet_name = "Apvnet"
     rg_name = "Appsrg01"
     pip_name = "apip"
     pip_loc = "West US"
     bastion_name = "Apbastion"
     bastion_loc = "West US"
    
  }
}

nsg = {
  nsg1 = {
    nsg_name = "apnsg1"
    nsg_loc = "West US"
    rg_name = "Appsrg01"
    sbnet_name = "subnet1"
    vnet_name = "Apvnet"
    security_rule = [ {
      name = "ap1"
      priority = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    ]
    tags = {
      env = "Dev"
    }
    
  }
}