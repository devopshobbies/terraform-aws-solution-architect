output "efs_availability_zone_name" {
  description = "Availability zone name"
  value       = aws_efs_file_system.efs_fs.availability_zone_name
}

output "efs_token_name" {
  description = "Token name"
  value       = aws_efs_file_system.efs_fs.creation_token
}

output "efs_encryption_status" {
  description = "Encryption status"
  value       = aws_efs_file_system.efs_fs.encrypted
}

output "efs_lifecycle_policy" {
  description = "Lifecycle policy"
  value       = aws_efs_file_system.efs_fs.lifecycle_policy
}

output "efs_performance_mode" {
  description = "Performance mode"
  value       = aws_efs_file_system.efs_fs.performance_mode
}

output "efs_throughput_mode" {
  description = "Throughput mode"
  value       = aws_efs_file_system.efs_fs.throughput_mode
}