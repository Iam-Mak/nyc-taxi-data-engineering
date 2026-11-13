
# Read Foundation Terraform state
data "terraform_remote_state" "foundation" {
  backend = "local"

  config = {
    path = "../foundation/terraform.tfstate"
  }
}

# Read Databricks Terraform state
data "terraform_remote_state" "databricks" {
  backend = "local"

  config = {
    path = "../databricks/terraform.tfstate"
  }
}
