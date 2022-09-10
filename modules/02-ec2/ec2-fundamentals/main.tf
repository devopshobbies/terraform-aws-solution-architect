data "aws_ami" "amazon-linux-2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}
resource "aws_instance" "web" {
  for_each = var.ec2_deployments
  ami = data.aws_ami.amazon-linux-2.id 
  instance_type = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name= "aws_key"
  user_data = "${file("user-data-httpd.sh")}"
  tags = {
    Name = each.key
  }
    depends_on = [
      aws_security_group.main
    ]
}
// Secure the PgSQL RDS cluster using a dedicated SG
resource "aws_security_group" "main" {
  name        = "Main Security Group"
  description = "Main Security Group"
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "ICMP from VPC"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "MAIN Security Group"
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key =  var.public_key
}
