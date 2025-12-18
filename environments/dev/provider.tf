terraform {
  required_providers {
    azurerm ={
        version = "4.40"
        source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name = "Apbackend"
    storage_account_name = "apstg0001009000"
    container_name = "backend"
    key = "apstate.tf"
    
  }
}

provider "azurerm" {
    features {}
    subscription_id = "c8d95a4f-bba8-4175-b204-f389ec30d92c"
}