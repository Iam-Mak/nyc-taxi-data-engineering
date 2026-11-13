
variable "workspace_name" {
  description = "Azure Databricks workspace name"
  type        = string
}

variable "managed_resource_group_name" {
  description = "Resource group managed by Azure Databricks"
  type        = string
}

variable "access_connector_name" {
  description = "Azure Databricks Access Connector name"
  type        = string
}

variable "sku" {
  description = "Azure Databricks workspace pricing tier"
  type        = string
  default     = "premium"

  validation {
    condition     = contains(["premium", "trial"], var.sku)
    error_message = "SKU must be premium or trial."
  }
}
