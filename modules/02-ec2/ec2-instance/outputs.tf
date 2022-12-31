output "ec2-instance-ipv4" {
  value       = aws_instance.ec2-instance.*.public_ip
  description = "IPV4 of Created EC2-Instance"
}

output "ec2-instance-id" {
  value       = aws_instance.ec2-instance.*.id
  description = "ID of Created EC2-Instance"
}

output "ec2-instance-name" {
  value       = aws_instance.ec2-instance.*.tags
  description = "Name of Created EC2-Instance"
}

output "ec2-instance-dns" {
  value       = aws_instance.ec2-instance.*.public_dns
  description = "Public DNS of Created EC2-Instance"
}

output "ec2-elastic-address" {
  description = "Elastic IP Address"
  value       = one(aws_eip.ec2-eip[*].address)
}

output "ec2-security-group-id" {
  value       = aws_security_group.ec2-sg.id
  description = "The EC2 Security Group ID"
}