provider "aws" {
  region = var.region
}

module "ec2-instance" {
  source        = "../../modules/02-ec2/ec2-instance"
  instance_type = var.instance_type
  instance_name = var.instance_name
  ami           = var.ami

}

module "ebs-volume" {
  source          = "../../modules/02-ec2/ec2-ebs"
  ebs_device_name = var.ebs_device_name
  ebs_vol_size    = var.ebs_vol_size
  encrypt_ebs     = var.encrypt_ebs

  instance_id       = module.ec2-instance.ec2-instance-id
  availability_zone = module.ec2-instance.ec2-instance-az
}