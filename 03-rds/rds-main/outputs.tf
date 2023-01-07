output "rds-vol-name" {
  value       = module.rds-main.rds-vol-name
  description = "RDS Volume Name"
}

output "rds-vol-id" {
  value       = module.rds-main.rds-vol-id
  description = "RDS Volume ID"
}

output "rds-vol-address" {
  value       = module.rds-main.rds-vol-address
  description = "RDS Volume Address"
}

output "rds-vol-engine" {
  value       = module.rds-main.rds-vol-engine
  description = "RDS Volume Engine"
}

output "rds-vol-engine-version" {
  value       = module.rds-main.rds-vol-engine
  description = "RDS Volume Engine Version"
}