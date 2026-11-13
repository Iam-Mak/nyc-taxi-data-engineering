
# Read outputs from the Foundation Terraform state
data "terraform_remote_state" "foundation" {
  backend = "local"

  config = {
    path = "../foundation/terraform.tfstate"
  }
}
