provider "aws" {
  region              = var.region
}
module "iam_ec2_fundamentals" {
  source = "../../modules/02-ec2/ec2-fundamentals"
  flavor = var.Flavor
  public_key = var.public_key
}
