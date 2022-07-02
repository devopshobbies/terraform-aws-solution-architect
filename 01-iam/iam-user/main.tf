provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source = "../../modules/01-iam/iam-user"

  username                = var.username
  group                   = var.group
  password_reset_required = var.password_reset_required
}
