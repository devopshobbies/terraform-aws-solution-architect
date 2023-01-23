provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
  source         = "../../modules/02-ec2/ec2-instance"
  instance_type  = "t2.micro"
  instance_name  = "ec2_instance_default"
  ami            = "ami-05fa00d4c63e32376"
  number_of_instances = 2

  use_elastic_ip = true

}

module "route53-main" {
  source = "../../modules/05-route53/route53-main"

  force_destroy = var.force_destroy

  hosted_zone_name = var.hosted_zone_name

  routing_policy_type = "weighted"

  config_list = [
    {
      record_name      = "weighted_1"
      record_type      = "A"
      hosted_zone_name = var.hosted_zone_name

      identifier = "weighted-primary"
      ttl        = 300

      records_list = [module.ec2-instance.ec2-instance-ipv4[0]]

      alias = {
        name = var.hosted_zone_name
      }
      weighted_routing_policy = {
        weight = 80
      }
    },
    {
      record_name      = "weighted_2"
      record_type      = "A"
      hosted_zone_name = var.hosted_zone_name

      identifier = "weighted-secondary"
      ttl        = 600

      records_list = [module.ec2-instance.ec2-instance-ipv4[1]]

      weighted_routing_policy = {
        weight = 20
      }
    }
  ]
}