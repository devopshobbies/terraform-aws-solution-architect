# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "config_list" {
  description = "List of Configs For Route53 Resource"
  type        = any
}

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
  default     = false
}

variable "record_name" {
  description = "The Name of The Record"
  type        = string
  default     = "test"
}

variable "record_type" {
  description = "The Record Type. Valid Values Are 'A', 'Aaaa', 'Caa', 'Cname', 'Mx', 'Naptr', 'Ns', 'Ptr', 'Soa', 'Spf', 'Srv' And 'Txt'"
  type        = string
  default     = "A"
}

variable "records_list" {
  description = "List of Records"
  type        = list(string)
  default     = [""]
}

variable "ttl" {
  description = "The TTL of The Record"
  type        = number
  default     = 300
}

variable "routing_policy_type" {
  description = "The Type of Routing Policy"
  type        = string
  default     = ""
}