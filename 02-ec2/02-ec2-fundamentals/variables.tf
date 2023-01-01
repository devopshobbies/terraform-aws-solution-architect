variable "region" {
  description = "region eu-east-1"
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
variable "public_key" {
  description = "Public Key"
  type        = string
}
