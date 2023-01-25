output "efs_availability_zone_name" {
  description = "Availability zone name"
  value       = module.efs_storage.efs_availability_zone_name
}

output "efs_token_name" {
  description = "Token name"
  value       = module.efs_storage.efs_token_name
}

output "efs_encryption_status" {
  description = "Encryption status"
  value       = module.efs_storage.efs_encryption_status
}

output "efs_lifecycle_policy" {
  description = "Lifecycle policy"
  value       = module.efs_storage.efs_lifecycle_policy
}

output "efs_performance_mode" {
  description = "Performance mode"
  value       = module.efs_storage.efs_performance_mode
}

output "efs_throughput_mode" {
  description = "Throughput mode"
  value       = module.efs_storage.efs_throughput_mode
}