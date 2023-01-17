# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "allocated_storage" {
  description = "Allocated Storage For DB Instance In GB"
  type        = number
  default = 5
}

variable "max_allocated_storage" {
  description = "When Configured, The Upper Limit To Which Amazon RDS Can Automatically Scale The Storage of The DB Instance"
  type        = number
  default = 10
}

variable "backup_retention_period" {
  description = "The Days To Retain Backups For. Must Be Between 0 And 35"
  type        = number
  default     = 1
}

variable "skip_final_snapshot" {
  description = <<EOT
  Determines Whether A Final Db Snapshot Is Created Before The Db Instance Is Deleted.
  If True Is Specified, No Dbsnapshot Is Created.
  If False Is Specified, A Db Snapshot Is Created Before The Db Instance Is Deleted
  EOT
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Specifies If The RDS Instance Is Multi-Az"
  type        = bool
  default     = true
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
  type        = bool
  default     = true
}

variable "apply_method" {
  description = "(Optional) 'immediate' (Default), Or 'pending-reboot'. Some Engines Can'T Apply Some Parameters Without A Reboot, And You Will Need To Specify 'pending-reboot' Here"
  type        = string
  default     = "immediate"
}