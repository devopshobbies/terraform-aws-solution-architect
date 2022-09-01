resource "aws_iam_role" "ec2_role" {
  name = "ec2-role"
  assume_role_policy = "${file("ec2-role.json")}"
}
resource "aws_iam_policy" "ec2_policy" {
  name        = "ec2-policy"
  description = "A ec2 policy"
  policy = "${file("ec2-policy.json")}"
}
resource "aws_iam_role_policy_attachment" "ec2-attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-profile"
  role = aws_iam_role.ec2_role.name
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type =  var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name= "aws_key"
  tags = {
    Name = var.instance_name
  }
}
// Secure the EC2 
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
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key =  var.public_key
}