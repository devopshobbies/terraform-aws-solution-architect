provider "aws" {
  region = var.region
}
module "iam_role" {
  source     = "../../modules/01-iam/iam-role"
  instance_type     = var.instance_type
  public_key = var.public_key
}
