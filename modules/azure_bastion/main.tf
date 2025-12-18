data "azurerm_subnet" "sbnet" {
  for_each = var.bastion  
  name                 = each.value.sbnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}


resource "azurerm_public_ip" "pip" {
  for_each =   var.bastion
  name                = each.value.pip_name
  location            = each.value.pip_loc
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastion  
  name                = each.value.bastion_name
  location            = each.value.bastion_loc
  resource_group_name = each.value.rg_name

  ip_configuration {
        name                 = "configuration"
        subnet_id            = data.azurerm_subnet.sbnet[each.key].id
        public_ip_address_id = azurerm_public_ip.pip[each.key].id
      
    }
    
  }
