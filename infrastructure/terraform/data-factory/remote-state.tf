
data "terraform_remote_state" "foundation" {
  backend = "local"

  config = {
    path = "${path.module}/../foundation/terraform.tfstate"
  }
}
