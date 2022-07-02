output "iam_user_name" {
  value = one(aws_iam_user.dvhb[*].name)
}

output "iam_user_password" {
  value = one(aws_iam_user_login_profile.dvhb[*].password)
}

output "iam_user_accesskey" {
  value = one(aws_iam_access_key.dvhb[*].id)
}

output "iam_user_secret" {
  value     = one(aws_iam_access_key.dvhb[*].secret)
  sensitive = true
}

output "iam_group_name" {
    value = one(aws_iam_group.dvhb[*].name)
}