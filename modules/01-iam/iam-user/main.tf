# Definition of IAM Users and Groups 
resource "aws_iam_user" "dvhb" {
  count = var.create_user ? 1 : 0

  name = var.username
  path = var.path
  tags = var.tags
}

resource "aws_iam_user_login_profile" "dvhb" {
  count = var.create_user && var.create_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.dvhb[0].name
  pgp_key                 = var.pgp_key
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "dvhb" {
  count = var.create_user && var.create_iam_access_key ? 1 : 0

  user    = aws_iam_user.dvhb[0].name
  pgp_key = var.pgp_key
}

resource "aws_iam_group" "dvhb" {

  name = var.group
}

resource "aws_iam_group_membership" "dvhb" {

  name = "dvhb-group"

  users = [
    aws_iam_user.dvhb[0].name
  ]
  
  group = aws_iam_group.dvhb.name
}
