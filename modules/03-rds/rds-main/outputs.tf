output "rds-vol-name" {
  value       = aws_db_instance.db_instance.db_name
  description = "RDS Volume Name"
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