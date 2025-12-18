data "azurerm_subnet" "sbnet" {
  for_each = var.nsg  
  name                 = each.value.sbnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}


resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg
  name                = each.value.nsg_name
  location            = each.value.nsg_loc
  resource_group_name = each.value.rg_name

  dynamic "security_rule" {
    for_each = each.value.security_rule == null ? []:each.value.security_rule
    content {
        name                       = security_rule.value.name
        priority                   = security_rule.value.priority
        direction                  = security_rule.value.direction
        access                     = security_rule.value.access
        protocol                   = security_rule.value.protocol
        source_port_range          = security_rule.value.source_port_range
        destination_port_range     = security_rule.value.destination_port_range
        source_address_prefix      = security_rule.value.source_address_prefix
        destination_address_prefix = security_rule.value.destination_address_prefix
      
    }
    
  }

  tags = each.value.tags
}


resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each =   var.nsg
  subnet_id                 = data.azurerm_subnet.sbnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}