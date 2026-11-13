
variable "data_factory_name" {
  description = "Name of the Azure Data Factory instance"
  type        = string

  validation {
    condition = can(regex(
      "^[A-Za-z0-9][A-Za-z0-9-]{1,61}[A-Za-z0-9]$",
      var.data_factory_name
    ))
    error_message = "The Data Factory name must be 3-63 characters, start and end with a letter or number, and contain only letters, numbers, or hyphens."
  }
}