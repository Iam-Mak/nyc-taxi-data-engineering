variable "storage_credential_name" {
  description = "Unity Catalog storage credential name"
  type        = string
}

variable "external_location_name" {
  description = "Unity Catalog external location name"
  type        = string
}

variable "catalog_name" {
  description = "Main Unity Catalog name for the NYC Taxi data domain"
  type        = string
}

variable "schema_names" {
  description = "Unity Catalog data processing layer schemas"
  type        = set(string)

  validation {
    condition = (
      length(var.schema_names) > 0 &&
      alltrue([
        for schema in var.schema_names :
        can(regex("^[a-z][a-z0-9_]*$", schema))
      ])
    )
    error_message = "Schema names must start with a lowercase letter and contain only lowercase letters, numbers, and underscores."
  }
}