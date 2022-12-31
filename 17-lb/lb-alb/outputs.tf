output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The domain name of the load balancer"
}

output "alb_http_listener_arn" {
  value       = module.alb.alb_http_listener_arn
  description = "The ARN of the HTTP listener"
}