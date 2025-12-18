data "azurerm_subnet" "sbnet" {
  for_each = var.nic  
  name                 = each.value.sbnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}


resource "azurerm_network_interface" "main" {
  for_each = var.nic
  name                = each.value.nic_name
  location            = each.value.nic_loc
  resource_group_name = each.value.rg_name

  dynamic ip_configuration {
    for_each = each.value.ip_configuration
    content {
        name                          = ip_configuration.value.name
        subnet_id                     = data.azurerm_subnet.sbnet[each.key].id
        private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      
    }
    
  }
}
