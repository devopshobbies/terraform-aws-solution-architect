locals {
  username       = var.replicate_source_db != null ? null : var.username
  password       = var.replicate_source_db != null ? null : var.password
  engine         = var.replicate_source_db != null ? null : var.engine
  engine_version = var.replicate_source_db != null ? null : var.engine_version
}

resource "aws_db_parameter_group" "db_param" {
  count = var.create_db_param ? 1 : 0
  name   = "rds-terraform-group"
  family = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = var.apply_method
    }
  }

    lifecycle {
    create_before_destroy = true
  }
}


resource "aws_db_instance" "db_instance" {
  identifier             = var.identifier
  instance_class         = var.instance_class

  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage

  engine                 = local.engine
  engine_version         = local.engine_version

  username               = local.username
  password               = local.password
  
  publicly_accessible    = var.publicly_accessible
  skip_final_snapshot    = var.skip_final_snapshot

  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  parameter_group_name   = try(aws_db_parameter_group.db_param[0].name, "")

  availability_zone = var.multi_az ? null : var.availability_zone 

  backup_retention_period = var.backup_retention_period

  deletion_protection = var.deletion_protection
  
  multi_az = var.multi_az 

  storage_encrypted = var.storage_encrypted

  apply_immediately = var.apply_immediately

  replicate_source_db = var.replicate_source_db

  blue_green_update {

    enabled = var.blue_green_update
    
  }
}