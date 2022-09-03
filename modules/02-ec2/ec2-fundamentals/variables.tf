variable "ec2_deployments" {
  type = map
  default = {
    "web" = {
      "region" = "us-east-1"
      "instance_type" = "t2.micro"
      "ami" = "ami-05fa00d4c63e32376"
    },
    "app" = {
      "region" = "us-east-1"
      "instance_type" = "t2.micro"
      "ami" = "ami-05fa00d4c63e32376"
    },
    "backend" = {
      "region" = "us-east-1"
      "instance_type" = "t2.micro"
      "ami" = "ami-05fa00d4c63e32376"     
    }
  }
}
variable "instance_name" {
    description = "instance name"
    type = string
    default = "ec2-fundamentals"
}
variable "public_key" {
  description = "Public Key"
  type = string
  default = "key"
}