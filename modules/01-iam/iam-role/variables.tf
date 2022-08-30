variable "flavor" {
  description = "FLAVOR"
  type = string
  default = "t2.micro"
  
}

variable "ami" {
  description = "AMI"
  type = string
  default = "ami-05fa00d4c63e32376"
  
}

variable "instance_name" {
  description = "Instance Name"
  type = string
  default = "iam role"
  
}

variable "public_key" {
  description = "Public Key"
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSD1Sg+QrJ11fAFnXxO7BhboPGCqJg+0tHg96F00lt5LdCoewkcb78SMLXmkaoktJP8RvTxVzbo+C/9HyF40WZl8um+XW31WDFTclyIFJj2+gsv8JXI6NuxE2knQhgvWHKfrojstPFcHuVTm9VQgKwf7nPO6fPC4WNGCSwcQwnmoLrk72DKrHSEN4i3REoxSEjuk0p7LYyNYHRY7bPI2uvS9QpUm0KX2ygS+BzVb0x/q8gg6oBcdUX4r96CqMdT70V1hataqH5BTI8fUH31WZaP7ExDBv7TtH9Rz11lcAdehVJkv4n0HZGxhpEk/iRTEaP3W/IEYNtsp2mgINpIHM9 root@Admin"
  
}






























# ### IF VARS ###
# variable "create_user" {
#   description = "Whether to create the IAM user"
#   type        = bool
#   default     = true
# }
# variable "create_iam_user_login_profile" {
#   description = "Whether to create IAM user login profile"
#   type        = bool
#   default     = true
# }

# variable "create_iam_access_key" {
#   description = "Whether to create IAM access key"
#   type        = bool
#   default     = true
# }

# variable "password_reset_required" {
#   description = "Whether the user should be forced to reset the generated password on first login."
#   type        = bool
#   default     = false
# }
# ######

# variable "username" {
#   type        = string
#   default     = "dvh_user01"
#   description = "Username to create"
# }

# variable "group" {
#   type        = string
#   default     = "dvhb_group01"
#   description = "Group to create"
# }

# variable "owner" {
#   type        = string
#   default     = "Morteza.Rahimi"
#   description = "The Owner of the user"
# }

# variable "path" {
#   type        = string
#   default     = "/"
#   description = "Path in which to create the user"
# }

# variable "pgp_key" {
#   description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
#   type        = string
#   default     = ""
# }

# variable "password_length" {
#   description = "The length of the generated password"
#   type        = number
#   default     = 20
# }

# variable "tags" {
#   description = "A map of tags to add to all resources."
#   type        = map(string)
#   default = {
#     created_by = "Terraform"
#   }
# }
