# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "region" {
  type    = string
  default = "us-east-1"
}

variable "token_name" {
  description = "A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = string
  default     = "my_efs_token_name"
}

variable "encryption" {
  description = "EFS encryption status."
  type        = bool
  default     = true
}

variable "infrequent_access_transition_dur" {
  description = "How long it takes to transition files to the IA storage class."
  type        = string
  default     = "AFTER_30_DAYS"
}

variable "tag_name" {
  description = "EFS tag name."
  type        = string
  default     = "new_efs_storage"
}