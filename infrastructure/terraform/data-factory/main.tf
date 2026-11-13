data "terraform_remote_state" "foundation" {
  backend = "local"

  config = {
    path = "${path.module}/../foundation/terraform.tfstate"
  }
}

resource "azurerm_data_factory" "main" {
  name                = var.data_factory_name
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location = data.terraform_remote_state.foundation.outputs.resource_group_location

  identity {
    type = "SystemAssigned"
  }

  tags = {
    project     = "nyc-taxi"
    environment = "dev"
  }
}