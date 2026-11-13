
output "storage_credential_name" {
  description = "Unity Catalog storage credential name"
  value       = databricks_storage_credential.nyc_taxi.name
}

output "external_location_name" {
  description = "Unity Catalog external location name"
  value       = databricks_external_location.raw.name
}

output "external_location_url" {
  description = "ADLS Gen2 external location URL"
  value       = databricks_external_location.raw.url
}

output "catalog_name" {
  description = "NYC Taxi Unity Catalog name"
  value       = databricks_catalog.nyc_taxi.name
}

output "schema_names" {
  description = "Unity Catalog processing layer schemas"
  value       = [for schema in databricks_schema.layers : schema.name]
}
