locals {
  project_name = "nyc-taxi-data-engineering"
  environment  = "dev"

  common_tags = {
    project     = local.project_name
    environment = local.environment
    managed_by  = "terraform"
    workload    = "data-engineering"
    data_domain = "transportation"
  }

  containers = toset([
    "raw",
    "bronze",
    "silver",
    "gold",
    "managed"
  ])
}