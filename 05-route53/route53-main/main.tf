provider "aws" {
  region = "us-east-1"
}

module "route53-main" {
  source         = "../../modules/05-route53/route53-main"

  force_destroy = var.force_destroy

  hosted_zone_name = var.hosted_zone_name
  record_name = var.record_name

  record_type = var.record_type
  ttl = var.ttl
  records_list = var.records_list
}