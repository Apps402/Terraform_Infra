module "rg" {
    source = "../../modules/azurerm_resource_group"
    rgs = var.rgs
    
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/azure_networking"
    vnet = var.vnet 
}

// module "keyvault" {
//     depends_on = [ module.rg ]
//     source = "../../modules/azurerm_keyvault"
//     keyvault = var.keyvault  
// }

// module "key_vault_secrets" {
//    depends_on = [module.keyvault]
//    source = "../../modules/azure_keyvault_secrets"
//    keyvault_secrets = var.keyvault_secrets
// }

// module "bastion" {
//     depends_on = [ module.rg ]
//     source = "../../modules/azure_bastion"
//     bastion = var.bastion
  
// }


// module "nic" {
//     depends_on = [ module.vnet ]
//     source = "../../modules/azurerm_nic"
//     nic = var.nic
  
// }


// module nsg{
//     depends_on = [ module.rg ]
//     source = "../../modules/azure_nsg"
//     nsg = var.nsg

// }

// module "vm" {
//     depends_on = [ module.nic , module.key_vault_secrets ]
//     source = "../../modules/azure_compute"
//     vm = var.vm
  
// }