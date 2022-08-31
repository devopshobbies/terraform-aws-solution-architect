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
  instance_type =  var.flavor
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
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key =  var.public_key
}


































# # Definition of IAM Users and Groups 
# resource "aws_iam_user" "dvhb" {
#   count = var.create_user ? 1 : 0

#   name = var.username
#   path = var.path
#   tags = var.tags
# }

# resource "aws_iam_user_login_profile" "dvhb" {
#   count = var.create_user && var.create_iam_user_login_profile ? 1 : 0

#   user                    = aws_iam_user.dvhb[0].name
#   pgp_key                 = var.pgp_key
#   password_length         = var.password_length
#   password_reset_required = var.password_reset_required
# }

# resource "aws_iam_access_key" "dvhb" {
#   count = var.create_user && var.create_iam_access_key ? 1 : 0

#   user    = aws_iam_user.dvhb[0].name
#   pgp_key = var.pgp_key
# }

# resource "aws_iam_group" "dvhb" {

#   name = var.group
# }

# resource "aws_iam_group_membership" "dvhb" {

#   name = "dvhb-group"

#   users = [
#     aws_iam_user.dvhb[0].name
#   ]
  
#   group = aws_iam_group.dvhb.name
# }
>>>>>>> 5661c6f6522a3816bddc6e7efcd4e03d4cae4c67
