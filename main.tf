terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.34.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "db95484c-40b0-4912-8066-3631243ad225"
  features {
    netapp {
      prevent_volume_destruction             = false
      delete_backups_on_backup_vault_destroy = true
    }
  }
}

resource "azurerm_resource_group" "anf_bcdr_rg" {
  name     = "anf-bcdr-rg"
  location = "UK South"
  tags = {
    Environment = "lab"
  }
}