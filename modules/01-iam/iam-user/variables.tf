### IF VARS ###
variable "create_user" {
  description = "Whether to create the IAM user"
  type        = bool
  default     = true
}
variable "create_iam_user_login_profile" {
  description = "Whether to create IAM user login profile"
  type        = bool
  default     = true
}

variable "create_iam_access_key" {
  description = "Whether to create IAM access key"
  type        = bool
  default     = true
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = false
}
######

variable "username" {
  type        = string
  default     = "dvh_user01"
  description = "Username to create"
}

variable "group" {
  type        = string
  default     = "dvhb_group01"
  description = "Group to create"
}

variable "owner" {
  type        = string
  default     = "Morteza.Rahimi"
  description = "The Owner of the user"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the user"
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default = {
    created_by = "Terraform"
  }
}
