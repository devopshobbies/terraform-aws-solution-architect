# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "alb_name" {
  description = "The Name To Use For This ALB"
  type        = string
}

variable "subnet_ids" {
  description = "The Subnet IDs To Deploy"
  type        = list(string)
}

variable "security_group_id" {
  description = "The Security Group"
  type        = any
}