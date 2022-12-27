provider "aws" {
  region = var.region
}

module "ec2-instance" {
  source         = "../../modules/02-ec2/ec2-instance"
  instance_type  = var.instance_type
  instance_name  = var.instance_name
  ami            = var.ami
  use_elastic_ip = true

}