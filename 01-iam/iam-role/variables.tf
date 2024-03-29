variable "region" {
  description = "region eu-east-1"
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}
variable "public_key" {
  description = "Public Key" 
  type        = string
  # default     = ""
}