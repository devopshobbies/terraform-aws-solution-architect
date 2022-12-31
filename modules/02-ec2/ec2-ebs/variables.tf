# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "ebs_device_name" {
  description = "Name of EBS Device"
  type        = string
}

variable "instance_id" {
  description = "Corresponding Instance ID For EBS"
  type        = string
}

variable "ebs_vol_size" {
  description = "EBS Volume Size"
  type        = number
}

variable "availability_zone" {
  description = "EBS Availability Zone (Must Be Same As EC2 AZ)"
  type        = string
}

variable "encrypt_ebs" {
  description = "EBS Encryption Status"
  type        = bool
}
