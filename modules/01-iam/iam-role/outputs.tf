output "id" {
  description = "The ID of the instance"
  value       = aws_instance.web.id
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.web.private_dns
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.web.public_dns
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = aws_instance.web.public_ip
}


output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = aws_instance.web.private_ip
}


output "aws_iam_instance_profile_name" {
  description = "aws_iam_instance_profile name"
  value = aws_iam_instance_profile.ec2_profile.name
  
}

output "aws_iam_instance_profile_id" {
  description = "aws_iam_instance_profile id"
  value = aws_iam_instance_profile.ec2_profile.id
  
}



output "aws_iam_instance_profile_role" {
  description = "aws_iam_instance_profile role"
  value = aws_iam_instance_profile.ec2_profile.role
  
}



output "aws_security_group_id" {
  description = "aws_security_group id"
  value = aws_security_group.main.id
  
}


output "aws_security_group_name" {
  description = "aws_security_group name"
  value = aws_security_group.main.name
  
}


output "aws_security_group_ingress" {
  description = "aws_security_group ingress"
  value = aws_security_group.main.ingress
  
}

output "aws_key_pair" {
  description = "aws_key_pair public_key"
  value = aws_key_pair.deployer
  
}




# output "iam_user_name" {
#   value = one(aws_iam_user.dvhb[*].name)
# }

# output "iam_user_password" {
#   value = one(aws_iam_user_login_profile.dvhb[*].password)
# }

# output "iam_user_accesskey" {
#   value = one(aws_iam_access_key.dvhb[*].id)
# }

# output "iam_user_secret" {
#   value     = one(aws_iam_access_key.dvhb[*].secret)
#   sensitive = true
# }

# output "iam_group_name" {
#     value = one(aws_iam_group.dvhb[*].name)
# }