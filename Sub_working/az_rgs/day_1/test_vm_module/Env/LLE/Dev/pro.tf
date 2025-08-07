terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d233f980-5790-4721-bd17-c56fdf9b8609"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "storage-rg"
    storage_account_name = "terraformstorge"
    container_name       = "state-con"
    key                  = "dev_test.terraform.tfstate"
  }
}

