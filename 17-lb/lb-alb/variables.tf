# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

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

variable "number_of_instances" {
  description = "Numbe of Instances"
  type        = number
  default = 3
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "alb_name" {
  description = "The name to use for this ALB"
  type        = string
  default = "elb-alb"
}

variable "use_user_data" {
  description = "Use User Data Status"
  type        = bool
  default = true
}