output "route-record-name" {
  value       = module.route53-main.route-record-name
  description = "Route53 Record Name"
}

output "route-records" {
  value       = module.route53-main.route-records
  description = "Route53 Records"
}

output "route-record-ttl" {
  value       = module.route53-main.route-record-ttl
  description = "Route53 TTL"
}