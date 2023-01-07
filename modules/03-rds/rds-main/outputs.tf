output "rds-vol-name" {
  value       = aws_db_instance.db_instance.db_name
  description = "RDS Volume Name"
}

output "rds-vol-id" {
  value       = aws_db_instance.db_instance.id
  description = "RDS Volume ID"
}

output "rds-vol-address" {
  value       = aws_db_instance.db_instance.address
  description = "RDS Volume Address"
}

output "rds-vol-engine" {
  value       = aws_db_instance.db_instance.engine
  description = "RDS Volume Engine"
}

output "rds-vol-engine-version" {
  value       = aws_db_instance.db_instance.engine_version
  description = "RDS Volume Engine Version"
}

output "rds-vol-replicas" {
  value       = aws_db_instance.db_instance.replicas
  description = "RDS Volume Replicas"
}

output "rds-vol-replica-mode" {
  value       = aws_db_instance.db_instance.replica_mode
  description = "RDS Volume Replica Mode"
}

output "rds-vol-replica-source-db" {
  value       = aws_db_instance.db_instance.replicate_source_db
  description = "RDS Volume Source DB"
}