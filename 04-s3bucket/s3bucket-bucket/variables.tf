# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "bucket_name" {
  description = "The Name of The Bucket"
  type        = string
  default     = "test-s3-with-terraform-bucket"
}

variable "create_bucket" {
  description = "Controls If S3 Bucket Should Be Created"
  type        = bool
  default     = true
}