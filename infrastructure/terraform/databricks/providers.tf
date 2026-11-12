terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Read the Foundation Terraform state
data "terraform_remote_state" "foundation" {
  backend = "local"

  config = {
    path = "../foundation/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = data.terraform_remote_state.foundation.outputs.subscription_id
}