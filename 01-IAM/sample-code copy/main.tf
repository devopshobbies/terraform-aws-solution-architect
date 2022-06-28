# Definition of IAM Users and Groups 
resource "aws_iam_user" "dvh01" {
  name = "dvh01"
  tags = {
    created_by = "terraform"
    owner      = "babak.doraniarab"
  }
}
resource "aws_iam_user" "dvh02" {
  name = "dvh02"
  tags = {
    created_by = "terraform"
    owner      = "ahmadali.bagheri"
  }
}

resource "aws_iam_user" "dvh03" {
  name = "dvh03"
  tags = {
    created_by = "terraform"
    owner      = "morteza.rahimi"
  }
}
resource "aws_iam_group" "admin-group" {
  name = "administrators"
}

# Assign users to group
resource "aws_iam_group_membership" "team" {
  name = "devopshobbies-group-membership"

  users = [
    aws_iam_user.dvh03.name,
    aws_iam_user.dvh02.name,
    aws_iam_user.dvh01.name,
  ]

  group = aws_iam_group.admin-group.name
}

# Attach policy to the group 
# We are going to make these three users full Administrators
resource "aws_iam_group_policy_attachment" "attach" {
  group      = aws_iam_group.admin-group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

