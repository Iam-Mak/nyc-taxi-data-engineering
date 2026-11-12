
# Storage credential using the existing Access Connector
resource "databricks_storage_credential" "nyc_taxi" {
  name = var.storage_credential_name

  azure_managed_identity {
    access_connector_id = data.terraform_remote_state.databricks.outputs.access_connector_id
  }

  comment = "Managed identity access to NYC Taxi ADLS Gen2"
}

# External location pointing to the raw container
resource "databricks_external_location" "raw" {
  name = var.external_location_name

  url = format(
    "abfss://raw@%s.dfs.core.windows.net/",
    data.terraform_remote_state.foundation.outputs.storage_account_name
  )

  credential_name = databricks_storage_credential.nyc_taxi.name

  comment = "NYC Taxi raw data in ADLS Gen2"
}
