# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_type" {
  description = "Default Instance Type"
  type        = string
}

variable "ami" {
  description = "Default Amazon Machine Image Type(AMI)"
  type        = string
}

variable "instance_name" {
  description = "Default Instance Name"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "use_elastic_ip" {
  description = "Default Usage of Elastic IP"
  type        = bool
  default     = false
}

variable "number_of_instances" {
  description = "Numbe of Instances"
  type        = number
  default = 1
}