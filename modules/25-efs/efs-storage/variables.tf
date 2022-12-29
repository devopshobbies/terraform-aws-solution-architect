# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "availability_zone_name" {
  description = "Avalability zone name (used for one zone efs)."
  type        = string
  default     = null
}

variable "performance_mode" {
  description = "The file system performance mode."
  type        = string
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "Throughput mode for the file system."
  type        = string
  default     = "provisioned"
}

variable "provisioned_throughput_in_mibps_val" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system."
  type        = number
  default     = 10
}

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "token_name" {
  description = "A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = string
}

variable "encryption" {
  description = "EFS encryption status."
  type        = bool
}

variable "infrequent_access_transition_dur" {
  description = "How long it takes to transition files to the IA storage class."
  type        = string
}

variable "tag_name" {
  description = "EFS tag name."
  type        = string
}