data "azurerm_network_interface" "nic" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "vault" {
  for_each = var.vm
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "vmusername" {
  for_each = var.vm
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}

data "azurerm_key_vault_secret" "vmpwd" {
  for_each = var.vm
  name         = "vmpwd"
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}





resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vm
    name = each.value.vmname
    location = each.value.vm_loc
    resource_group_name = each.value.rg_name
    size = each.value.vmsize
    admin_username = data.azurerm_key_vault_secret.vmusername[each.key].value
    admin_password = data.azurerm_key_vault_secret.vmpwd[each.key].value
    disable_password_authentication = false
    network_interface_ids = [ 
      data.azurerm_network_interface.nic[each.key].id
     ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
    

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )



}