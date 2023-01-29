# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "bucket" {
  description = "(Optional, Forces New Resource) The Name Of The Bucket. If Omitted, Terraform Will Assign A Random, Unique Name"
  type        = string
  default     = "my-bucket"
}

variable "bucket_prefix" {
  description = "(Optional, Forces New Resource) Creates A Unique Bucket Name Beginning With The Specified Prefix. Conflicts With Bucket"
  type        = string
  default     = null
}

variable "create_bucket" {
  description = "Controls If S3 Bucket Should Be Created"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "(Optional, Default:False ) A Boolean That Indicates All Objects Should Be Deleted From The Bucket So That The Bucket Can Be Destroyed Without Error. These Objects Are Not Recoverable"
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Whether S3 Bucket Should Have An Object Lock Configuration Enabled"
  type        = bool
  default     = false
}

variable "expected_bucket_owner" {
  description = "The account ID of the expected bucket owner"
  type        = string
  default     = null
}

variable "object_lock_configuration" {
  description = "Map containing S3 object locking configuration."
  type        = any
  default     = {}
}

variable "logging" {
  description = "Map containing access bucket logging configuration."
  type        = map(string)
  default     = {}
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Conflicts with `grant`"
  type        = string
  default     = null
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = {}
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}

variable "acceleration_status" {
  description = "(Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended."
  type        = string
  default     = null
}

variable "request_payer" {
  description = "(Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information."
  type        = string
  default     = null
}

variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
  default     = []
}