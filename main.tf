# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"

  # terraform cloud backend
  backend "remote" {
    organization = "devopsninja"
    workspaces {
      name = "azure-workspace-1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}

# virtual network
resource "azurerm_virtual_network" "vnet" {
  name = "myTFVnet"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    Environment = "dev"
    Team = "DevOps"
  }
}