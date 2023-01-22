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

  routing_policy_type = "failover"

  config_list = [
    {
      record_name      = "fail_1"
      record_type      = "A"
      hosted_zone_name = var.hosted_zone_name

      identifier = "failover-primary"
      ttl        = 300

      records_list = [module.ec2-instance.ec2-instance-ipv4[0]]
      health_check_id = aws_route53_health_check.failover.id

      alias = {
        name = var.hosted_zone_name
      }
      failover_routing_policy = {
        type = "PRIMARY"
      }
    },
    {
      record_name      = "fail_2"
      record_type      = "A"
      hosted_zone_name = var.hosted_zone_name

      identifier = "failover-secondary"
      ttl        = 600

      records_list = [module.ec2-instance.ec2-instance-ipv4[1]]

      failover_routing_policy = {
        type = "SECONDARY"
      }
    }
  ]
}

resource "aws_route53_health_check" "failover" {
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
  ip_address = module.ec2-instance.ec2-instance-ipv4[0]
}