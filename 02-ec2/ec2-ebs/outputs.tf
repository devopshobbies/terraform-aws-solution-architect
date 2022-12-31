output "ebs-vol-arn" {
  value       = module.ebs-volume.ebs-vol-arn
  description = "EBS Volume ARN"
}

output "ebs-vol-size" {
  value       = module.ebs-volume.ebs-vol-size
  description = "EBS Volume Size"
}

output "ebs-vol-type" {
  value       = module.ebs-volume.ebs-vol-type
  description = "EBS Volume Type"
}

output "ebs-vol-az" {
  value       = module.ebs-volume.ebs-vol-az
  description = "EBS Volume Availability Zone"
}