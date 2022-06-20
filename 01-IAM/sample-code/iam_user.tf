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

resource "aws_iam_group" "first-group" {
  name = "first-group"
}

# Assign users to group
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.dvh02.name,
    aws_iam_user.dvh01.name,
  ]

  group = aws_iam_group.first-group.name
}

# attach policy to the group 

# EC2 Full access ARN is just a sample, you can use each policy you want or even you can creat your own policy 
#arn:aws:iam::aws:policy/AmazonEC2FullAccess
resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.first-group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
