variable "ec2_deployments" {
  type = map
  default = {
    "web" = {
      "region" = "us-east-1"
      "instance_type" = "t2.micro"
    },
    "app" = {
      "region" = "us-east-1"
      "instance_type" = "t2.micro"
    },
    "backend" = {
      "region" = "us-east-1"
      "instance_type" = "t2.micro"
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
}