
# Storage credential using the existing Databricks Access Connector
resource "databricks_storage_credential" "nyc_taxi" {
  name = var.storage_credential_name

  azure_managed_identity {
    access_connector_id = data.terraform_remote_state.databricks.outputs.access_connector_id
  }

  comment = "Managed identity access to NYC Taxi ADLS Gen2"
}

# External location pointing to the ADLS Gen2 raw container
resource "databricks_external_location" "raw" {
  name = var.external_location_name

  url = format(
    "abfss://raw@%s.dfs.core.windows.net/",
    data.terraform_remote_state.foundation.outputs.storage_account_name
  )

  credential_name = databricks_storage_credential.nyc_taxi.name

  comment = "Governed access to NYC Taxi raw data in ADLS Gen2"
}

# External location for Unity Catalog managed storage
resource "databricks_external_location" "managed" {
  name = "nyc_taxi_managed_location"

  url = format(
    "abfss://managed@%s.dfs.core.windows.net/",
    data.terraform_remote_state.foundation.outputs.storage_account_name
  )

  credential_name = databricks_storage_credential.nyc_taxi.name

  comment = "Governed storage location for NYC Taxi managed tables"
}

# Main project catalog
resource "databricks_catalog" "nyc_taxi" {
  name = var.catalog_name

  storage_root = format(
    "abfss://managed@%s.dfs.core.windows.net/nyc_taxi/",
    data.terraform_remote_state.foundation.outputs.storage_account_name
  )

  comment = "Central catalog for NYC Taxi data engineering and analytics"

  depends_on = [
    databricks_external_location.managed
  ]

  lifecycle {
    prevent_destroy = true
  }
}

# Data processing layer schemas
resource "databricks_schema" "layers" {
  for_each = var.schema_names

  name         = each.value
  catalog_name = databricks_catalog.nyc_taxi.name

  comment = "NYC Taxi ${each.value} data layer"
}
