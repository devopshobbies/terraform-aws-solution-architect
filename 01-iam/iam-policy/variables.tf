variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  description = "The name of the policy"
  type        = string
  default     = "My-policy"
}

variable "path" {
  description = "The name of the policy"
  type        = string
  default     = "/"
}
