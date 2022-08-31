provider "aws" {
  region = var.region
}
module "iam_role" {
  source     = "../../modules/01-iam/iam-role"
  flavor     = var.Flavor
  public_key = var.public_key
}
