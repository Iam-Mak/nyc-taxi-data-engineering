terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }
}

data "terraform_remote_state" "foundation" {
  backend = "local"

  config = {
    path = "../foundation/terraform.tfstate"
  }
}

data "terraform_remote_state" "databricks" {
  backend = "local"

  config = {
    path = "../databricks/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = data.terraform_remote_state.foundation.outputs.subscription_id
}

provider "databricks" {
  host = data.terraform_remote_state.databricks.outputs.workspace_url
}