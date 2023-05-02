provider "aws" {
  region = var.region
}

module "vpc-main" {
  source = "../../modules/12-vpc/vpc-main"

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway = true
  single_nat_gateway = true
  public_subnets       = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}