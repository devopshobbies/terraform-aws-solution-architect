provider "aws" {
  region = var.region
}

module "rds-main" {
  source          = "../../modules/03-rds/rds-main"
  identifier = "my-new-rds"
  instance_class = "db.t2.micro"
  username = "admin"
  password = "adminadmin"

  allocated_storage = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  backup_retention_period = var.backup_retention_period

  skip_final_snapshot = var.skip_final_snapshot

  multi_az = var.multi_az

  storage_encrypted = var.storage_encrypted

  engine = var.engine

  engine_version = var.engine_version

  apply_immediately = var.apply_immediately

  apply_method = var.apply_method
}