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
