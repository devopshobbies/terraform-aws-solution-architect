output "alb_dns_name" {
  value       = aws_lb.lb.dns_name
  description = "The domain name of the load balancer"
}

output "alb_http_listener_arn" {
  value       = aws_lb_listener.lb_listener_http.arn
  description = "The ARN of the HTTP listener"
}