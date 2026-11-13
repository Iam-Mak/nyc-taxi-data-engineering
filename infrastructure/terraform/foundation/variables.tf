variable "location" {
  description = "Azure region for project infrastructure"
  type        = string
  default     = "centralindia"
}

variable "resource_group_name" {
  description = "Project resource group name"
  type        = string
  default     = "rg-nyc-taxi-data-eng"
}

variable "storage_account_name" {
  description = "Globally unique ADLS Gen2 storage account name"
  type        = string

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )
    error_message = "Storage account name must be 3-24 characters and contain only lowercase letters and numbers."
  }
}