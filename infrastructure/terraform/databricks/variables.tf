variable "workspace_name" {
  description = "Azure Databricks workspace name"
  type        = string
}

variable "managed_resource_group_name" {
  description = "Resource group managed by Azure Databricks"
  type        = string
}

variable "sku" {
  description = "Databricks workspace pricing tier"
  type        = string
  default     = "trial"

  validation {
    condition     = contains(["trial", "standard", "premium"], var.sku)
    error_message = "SKU must be trial, standard or premium."
  }
}