output "id" {
  description = "The policy's ID"
  value       = one(aws_iam_policy.policy[*].id)
}

output "description" {
  description = "The description of the policy"
  value       = one(aws_iam_policy.policy[*].description)
}

output "name" {
  description = "The name of the policy"
  value       = one(aws_iam_policy.policy[*].name)
}

output "path" {
  description = "The path of the policy in IAM"
  value       = one(aws_iam_policy.policy[*].path)
}

output "policy" {
  description = "The policy document"
  value       = one(aws_iam_policy.policy[*].policy)
}