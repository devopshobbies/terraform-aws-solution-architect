# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "hosted_zone_name" {
  description = "This Is The Name of The Hosted Zone"
  type        = string
  default     = "testterrafromhostedzone.com"
}

variable "force_destroy" {
  description = "Whether To Destroy All Records (Possibly Managed Outside Of Terraform) In The Zone When Destroying The Zone"
  type        = bool
  default     = true
}

variable "record_name" {
  description = "The Name of The Record"
  type        = string
  default     = "geolocation"
}

