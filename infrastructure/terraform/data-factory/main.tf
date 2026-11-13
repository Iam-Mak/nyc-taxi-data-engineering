
resource "azurerm_data_factory" "main" {
  name                = var.data_factory_name
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location            = data.terraform_remote_state.foundation.outputs.resource_group_location

  identity {
    type = "SystemAssigned"
  }

  tags = data.terraform_remote_state.foundation.outputs.common_tags
}
