output "iam_user_name" {
  description = "The user's name"
  value       = module.iam_user.iam_user_name
}

output "iam_user_password" {
  description = "Password of the created user"
  value       = module.iam_user.iam_user_password
}

output "iam_user_accresskeyid" {
  description = "AccessKeyId"
  value       = module.iam_user.iam_user_accesskey
}

output "iam_user_secret" {
  description = "Secret"
  value       = module.iam_user.iam_user_secret
  sensitive   = true
}

output "iam_group_name" {
  description = "The user's name"
  value       = module.iam_user.iam_group_name
}