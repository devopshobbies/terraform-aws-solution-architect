resource "aws_instance" "web" {
  ami           = var.ami
  instance_type =  var.flavor
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name= "aws_key"
  user_data = "${file("user-data-httpd.sh")}"
#   user_data = <<EOF
# sudo yum update -y
# sudo yum install -y httpd
# sudo systemctl start httpd
# systemctl enable httpd
# echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html 
# EOF
  tags = {
    Name = var.instance_name
  }
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
