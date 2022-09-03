resource "aws_instance" "web" {
  for_each = var.ec2_deployments
  ami = each.value.ami 
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
  tags = {
    Name = "MAIN Security Group"
  }
}
// SSH can only be accessed from the WWW network (0.0.0.0/0)
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}
resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key =  var.public_key
}