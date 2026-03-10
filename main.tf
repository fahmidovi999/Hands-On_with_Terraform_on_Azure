terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "FDMGroup"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg" {
  name     = "813-1a1e2276-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source               = "app.terraform.io/FDMGroup/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "FDMOVISECURESTORAGE"
}