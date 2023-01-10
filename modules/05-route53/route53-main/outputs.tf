output "route-record-name" {
  value       = aws_route53_record.route_record.name
  description = "Route53 Record Name"
}

output "route-records" {
  value       = aws_route53_record.route_record.records
  description = "Route53 Records"
}

output "route-record-ttl" {
  value       = aws_route53_record.route_record.ttl
  description = "Route53 TTL"
}