output "storage_credential_name" {
  value = databricks_storage_credential.nyc_taxi.name
}

output "external_location_name" {
  value = databricks_external_location.raw.name
}

output "external_location_url" {
  value = databricks_external_location.raw.url
}