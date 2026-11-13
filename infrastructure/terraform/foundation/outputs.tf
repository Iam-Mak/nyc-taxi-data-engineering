output "resource_group_name" {
  description = "Project resource group name"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Project Azure region"
  value       = azurerm_resource_group.main.location
}

output "storage_account_name" {
  description = "ADLS Gen2 storage account name"
  value       = azurerm_storage_account.main.name
}

output "storage_account_id" {
  description = "ADLS Gen2 storage account resource ID"
  value       = azurerm_storage_account.main.id
}

output "storage_dfs_endpoint" {
  description = "ADLS Gen2 DFS endpoint"
  value       = azurerm_storage_account.main.primary_dfs_endpoint
}

output "storage_containers" {
  description = "ADLS Gen2 containers"
  value       = [for container in azurerm_storage_container.main : container.name]
}


output "common_tags" {
  description = "Common tags shared across project infrastructure"
  value       = local.common_tags
}
