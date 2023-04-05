output "route-record-name" {
  value       = [for route_info in aws_route53_record.route_record : route_info.name]
  description = "Route53 Record Name"
}

output "route-records" {
  value       = [for route_info in aws_route53_record.route_record : route_info.records]
  description = "Route53 Records"
}

output "route-record-ttl" {
  value       = [for route_info in aws_route53_record.route_record : route_info.ttl]
  description = "Route53 TTL"
}