variable "instance_type" {
  description = "instance_type"
  type = string
  default = "t2.micro" 
}
variable "ami" {
  description = "AMI"
  type = string
  default = "ami-05fa00d4c63e32376" 
}
variable "instance_name" {
  description = "instance_name"
  type = string
  default = "iam role" 
}
variable "public_key" {
  description = "Public Key"
  type = string
  default = "" 
}
