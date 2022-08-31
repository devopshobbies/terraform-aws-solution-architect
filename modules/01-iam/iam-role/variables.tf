variable "flavor" {
  description = "FLAVOR"
  type = string
  default = "t2.micro" 
}
variable "ami" {
  description = "AMI"
  type = string
  default = "ami-05fa00d4c63e32376" 
}
variable "instance_name" {
  description = "Instance Name"
  type = string
  default = "iam role" 
}
variable "public_key" {
  description = "Public Key"
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSD1Sg+QrJ11fAFnXxO7BhboPGCqJg+0tHg96F00lt5LdCoewkcb78SMLXmkaoktJP8RvTxVzbo+C/9HyF40WZl8um+XW31WDFTclyIFJj2+gsv8JXI6NuxE2knQhgvWHKfrojstPFcHuVTm9VQgKwf7nPO6fPC4WNGCSwcQwnmoLrk72DKrHSEN4i3REoxSEjuk0p7LYyNYHRY7bPI2uvS9QpUm0KX2ygS+BzVb0x/q8gg6oBcdUX4r96CqMdT70V1hataqH5BTI8fUH31WZaP7ExDBv7TtH9Rz11lcAdehVJkv4n0HZGxhpEk/iRTEaP3W/IEYNtsp2mgINpIHM9 root@Admin" 
}