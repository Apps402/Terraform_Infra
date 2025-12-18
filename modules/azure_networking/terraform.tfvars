vnet = {
  vnet1 = {
    name = "Apvnet"
    location = "West US"
    resource_group_name = "Appsrg01"
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