variable "ec2_deployments" {
  type = map(any)
  default = {
    "web" = {
      "region"        = "us-east-1"
      "instance_type" = "t2.micro"
    }
    # "app" = {
    #   "region" = "us-east-1"
    #   "instance_type" = "t2.micro"
    # },
    # "backend" = {
    #   "region" = "us-east-1"
    #   "instance_type" = "t2.micro"
    # }
  }
}
variable "instance_name" {
  description = "instance name"
  type        = string
  default     = "ec2-fundamentals"
}
variable "public_key" {
  description = "Public Key"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSD1Sg+QrJ11fAFnXxO7BhboPGCqJg+0tHg96F00lt5LdCoewkcb78SMLXmkaoktJP8RvTxVzbo+C/9HyF40WZl8um+XW31WDFTclyIFJj2+gsv8JXI6NuxE2knQhgvWHKfrojstPFcHuVTm9VQgKwf7nPO6fPC4WNGCSwcQwnmoLrk72DKrHSEN4i3REoxSEjuk0p7LYyNYHRY7bPI2uvS9QpUm0KX2ygS+BzVb0x/q8gg6oBcdUX4r96CqMdT70V1hataqH5BTI8fUH31WZaP7ExDBv7TtH9Rz11lcAdehVJkv4n0HZGxhpEk/iRTEaP3W/IEYNtsp2mgINpIHM9 root@Admin"
}