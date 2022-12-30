output "alb_dns_name" {
  value       = aws_lb.lb.dns_name
  description = "The domain name of the load balancer"
}

output "alb_http_listener_arn" {
  value       = aws_lb_listener.lb_listener_http.arn
  description = "The ARN of the HTTP listener"
}

output "alb_security_group_id" {
  value       = aws_security_group.sg_alb.id
  description = "The ALB Security Group ID"
}