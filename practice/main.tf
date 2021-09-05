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