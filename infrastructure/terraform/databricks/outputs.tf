
output "workspace_name" {
  description = "Databricks workspace name"
  value       = azurerm_databricks_workspace.main.name
}

output "workspace_url" {
  description = "Databricks workspace URL"
  value       = "https://${azurerm_databricks_workspace.main.workspace_url}/"
}

output "workspace_id" {
  description = "Databricks workspace ID"
  value       = azurerm_databricks_workspace.main.workspace_id
}

output "access_connector_id" {
  description = "Access Connector resource ID"
  value       = azurerm_databricks_access_connector.main.id
}

output "access_connector_principal_id" {
  description = "Managed identity principal ID"
  value       = azurerm_databricks_access_connector.main.identity[0].principal_id
}
