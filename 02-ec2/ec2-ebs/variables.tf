# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ebs_device_name" {
  description = "Name of EBS Device"
  type        = string
  default     = "/dev/sdh"
}

variable "ebs_vol_size" {
  description = "EBS Volume Size"
  type        = number
  default     = 2
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "Default Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "Default Amazon Machine Image Type(AMI)"
  type        = string
  default     = "ami-05fa00d4c63e32376"
}

variable "instance_name" {
  description = "Default Instance Name"
  type        = string
  default     = "ec2_instance_default"
}

variable "encrypt_ebs" {
  description = "EBS Encryption Status"
  type        = bool
  default     = true
}