terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "873c59ab-f0c9-4625-badc-4c3d50c3cd19"
}


