output "rds-vol-name-replica" {
  value       = module.rds-replica.rds-vol-name
  description = "RDS Replica Volume Name"
}

output "rds-vol-address-replica" {
  value       = module.rds-replica.rds-vol-address
  description = "RDS Replica Volume Address"
}

output "rds-vol-replicas" {
  value       = module.rds-replica.rds-vol-replicas
  description = "RDS Volume Replicas"
}

output "rds-vol-replica-mode" {
  value       = module.rds-replica.rds-vol-replica-mode
  description = "RDS Volume Replica Mode"
}

output "rds-vol-replica-source-db" {
  value       = module.rds-replica.rds-vol-replica-source-db
  description = "RDS Volume Source DB"
}