resource "aws_lb" "lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false
    tags = {
    Environment = "elb-example"
  }

}

resource "aws_lb_listener" "lb_listener_http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = local.http_port
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

locals {
  http_port    = 80
}