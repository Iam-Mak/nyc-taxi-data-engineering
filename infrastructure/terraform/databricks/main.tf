# Azure Databricks workspace
resource "azurerm_databricks_workspace" "main" {
  name = var.workspace_name

  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location            = data.terraform_remote_state.foundation.outputs.resource_group_location

  sku                         = var.sku
  managed_resource_group_name = var.managed_resource_group_name

  tags = {
    project     = "nyc-taxi-data-engineering"
    environment = "development"
    managed_by  = "terraform"
  }
}

# Databricks Access Connector
resource "azurerm_databricks_access_connector" "main" {
  name                = "ac-nyc-taxi-databricks"
  resource_group_name = data.terraform_remote_state.foundation.outputs.resource_group_name
  location            = data.terraform_remote_state.foundation.outputs.resource_group_location

  identity {
    type = "SystemAssigned"
  }

  tags = {
    project     = "nyc-taxi-data-engineering"
    environment = "development"
    managed_by  = "terraform"
  }
}

# Allow the connector's managed identity to access ADLS Gen2
resource "azurerm_role_assignment" "storage_access" {
  scope                = data.terraform_remote_state.foundation.outputs.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"

  principal_id   = azurerm_databricks_access_connector.main.identity[0].principal_id
  principal_type = "ServicePrincipal"

  skip_service_principal_aad_check = true
}