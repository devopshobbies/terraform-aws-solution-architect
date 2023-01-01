provider "aws" {
  region = var.region
}

module "alb" {
  source = "../../modules/17-lb/lb-alb"

  alb_name   = var.alb_name
  subnet_ids = data.aws_subnet_ids.default.ids
  security_group_id = module.ec2-instance.ec2-security-group-id
  
}

module "ec2-instance" {
  source         = "../../modules/02-ec2/ec2-instance"
  instance_type  = var.instance_type
  instance_name  = var.instance_name
  ami            = var.ami
  number_of_instances = var.number_of_instances
  use_user_data = var.use_user_data
  
  use_elastic_ip = true

}

resource "aws_lb_target_group" "lb_tg_ec2" {
  name     = "lb-tg-ec2-example"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = module.alb.alb_http_listener_arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg_ec2.arn
  }
}

resource "aws_alb_target_group_attachment" "alb_tg_att" {
  count            = length(module.ec2-instance.ec2-instance-id)
  target_group_arn = aws_lb_target_group.lb_tg_ec2.arn
  target_id        = element(module.ec2-instance.ec2-instance-id, count.index)
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}