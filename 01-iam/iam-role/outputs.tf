
output "instance_id" {
  description = "IP of the EC2 instance"
  value = module.iam_role.id

}

output "instance_private_dns" {
  description = "IP of the EC2 instance"
  value = module.iam_role.private_dns

}

output "instance_public_ip" {
  description = "IP of the EC2 instance"
  value = module.iam_role.public_ip

}

output "instance_private_ip" {
  description = "IP of the EC2 instance"
  value = module.iam_role.private_ip

}

output "aws_iam_instance_profile_name" {
  description = "aws_iam_instance_profile name"
  value = module.iam_role.aws_iam_instance_profile_name
  
}


output "aws_iam_instance_profile_id" {
  description = "aws_iam_instance_profile id"
  value = module.iam_role.aws_iam_instance_profile_id
  
}


output "aws_iam_instance_profile_role" {
  description = "aws_iam_instance_profile role"
  value = module.iam_role.aws_iam_instance_profile_role
  
}

output "aws_security_group_id" {
  description = "aws_security_group id"
  value = module.iam_role.aws_security_group_id

  
}


output "aws_security_group_name" {
  description = "aws_security_group name"
  value = module.iam_role.aws_security_group_name
  
}


output "aws_security_group_ingress" {
  description = "aws_security_group ingress"
  value = module.iam_role.aws_security_group_ingress
  
}

output "aws_key_pair" {
  description = "aws_key_pair public_key"
  value = module.iam_role.aws_key_pair
  
}




















