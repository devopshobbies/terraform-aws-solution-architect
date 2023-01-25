# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
 
variable "identifier" {
  description = "The Name of The RDS Instance"
  type        = string
  
}

variable "instance_class" {
  description = "The Instance Type of The RDS Instance"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "username" {
  description = "Username For The Master DB User"
  type        = string
  default = null
}

variable "password" {
  description = "Password For The Master DB User"
  type        = string
  default = null
  sensitive = true
}

variable "allocated_storage" {
  description = "Allocated Storage For DB Instance In GB"
  type        = number
  default = 5
}

variable "publicly_accessible" {
  description = "Bool To Control If Instance Is Publicly Accessible"
  type        = bool
  default = false
}

variable "max_allocated_storage" {
  description = "When Configured, The Upper Limit To Which Amazon RDS Can Automatically Scale The Storage of The DB Instance"
  type        = number
  default = 10
}

variable "allow_major_version_upgrade" {
  description = "Indicates That Major Version Upgrades Are Allowed"
  type        = bool
  default = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates That Minor Engine Upgrades Will Be Applied Automatically To The DB Instance During The Maintenance Window"
  type        = bool
  default = true
}

variable "availability_zone" {
  description = "RDS Availability Zone"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "The Days To Retain Backups For. Must Be Between 0 And 35"
  type        = number
  default     = 0
}

variable "blue_green_update" {
  description = "Enables Low-Downtime Updates Using RDS's Blue/Green Deployments"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = <<EOT
  Determines Whether A Final Db Snapshot Is Created Before The Db Instance Is Deleted.
  If True Is Specified, No Dbsnapshot Is Created.
  If False Is Specified, A Db Snapshot Is Created Before The Db Instance Is Deleted
  EOT
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Specifies If The RDS Instance Is Multi-Az"
  type        = bool
  default     = false
}

variable "storage_encrypted" {
  description = "Specifies Whether The DB Instance Is Encrypted"
  type        = bool
  default     = false
}

variable "engine" {
  description = "The Database Engine To Use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The Engine Version To Use"
  type        = string
  default     = "8.0.30"
}

variable "apply_immediately" {
  description = "Specifies Whether Any Database Modifications Are Applied Immediately, Or During The Next Maintenance Window"
  type        = string
  default     = "8.0.30"
}

variable "create_db_param" {
  description = "Specifies Whether DB Parameter Group Is Created"
  type        = bool
  default     = false
}

variable "parameters" {
  description = "Parameter Group"
  type        = list(map(string))
  default     = []
}

variable "deletion_protection" {
  description = "If The DB Instance Should Have Deletion Protection Enabled"
  type        = bool
  default     = false
}

variable "apply_method" {
  description = "(Optional) 'immediate' (Default), Or 'pending-reboot'. Some Engines Can'T Apply Some Parameters Without A Reboot, And You Will Need To Specify 'pending-reboot' Here"
  type        = string
  default     = "immediate"
}

variable "family" {
  description = "The Family Of The DB Parameter Group"
  type        = string
  default     = "mysql8.0"
}

variable "replicate_source_db" {
  description = "Specifies That This Resource Is A Replicate Database, And To Use This Value As The Source Database"
  type        = string
  default     = null
}