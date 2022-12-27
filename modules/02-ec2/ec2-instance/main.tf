resource "aws_instance" "ec2-instance" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.ec2-sg.id
  ]


  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name
  }

}

resource "aws_eip" "ec2-eip" {
  vpc = true
}

resource "aws_eip_association" "ec2-eip-association" {
  count = var.use_elastic_ip ? 1 : 0

  instance_id   = aws_instance.ec2-instance.id
  allocation_id = aws_eip.ec2-eip.id
}

resource "aws_security_group" "ec2-sg" {
  name = "${var.instance_name}-sg"
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.ec2-sg.id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.ec2-sg.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips
}


locals {
  http_port    = 22
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}