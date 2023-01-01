output "ec2-instance-ipv4" {
  value       = module.ec2-instance.ec2-instance-ipv4
  description = "IPV4 of created ec2-instance"
}

output "ec2-instance-id" {
  value       = module.ec2-instance.ec2-instance-id
  description = "ID of created ec2-instance"
}

output "ec2-instance-name" {
  value       = module.ec2-instance.ec2-instance-name
  description = "Name of created ec2-instance"
}

output "ec2-instance-dns" {
  value       = module.ec2-instance.ec2-instance-dns
  description = "Public dns of created ec2-instance"
}

output "ec2-elastic-address" {
  value       = module.ec2-instance.ec2-elastic-address
  description = "Elastic ip address"
}

output "ec2-security-group-id" {
  value       = module.ec2-instance.ec2-security-group-id
  description = "The EC2 Security Group ID"
}