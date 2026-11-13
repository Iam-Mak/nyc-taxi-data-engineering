# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = local.common_tags
}

# ADLS Gen2 Storage Account
resource "azurerm_storage_account" "main" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_kind             = "StorageV2"
  account_tier              = "Standard"
  account_replication_type = "LRS"

  is_hns_enabled  = true
  min_tls_version = "TLS1_2"

  tags = local.common_tags
}

# ADLS Gen2 containers
resource "azurerm_storage_container" "main" {
  for_each = local.containers

  name                  = each.value
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}