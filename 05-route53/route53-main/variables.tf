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
  default     = "terraform"
}

variable "record_type" {
  description = "The Record Type. Valid Values Are 'A', 'Aaaa', 'Caa', 'Cname', 'Mx', 'Naptr', 'Ns', 'Ptr', 'Soa', 'Spf', 'Srv' And 'Txt'"
  type        = string
  default     = "A"
}

variable "records_list" {
  description = "List of Records"
  type        = list(string)
  default     = ["11.12.13.14", "15.16.17.18"]
}

variable "ttl" {
  description = "The TTL of The Record"
  type        = number
  default     = 600
}


