output "ebs-vol-arn" {
  value       = aws_ebs_volume.ebs_vol.arn
  description = "EBS Volume ARN"
}

output "ebs-vol-size" {
  value       = aws_ebs_volume.ebs_vol.size
  description = "EBS Volume Size"
}

output "ebs-vol-type" {
  value       = aws_ebs_volume.ebs_vol.type
  description = "EBS Volume Type"
}

output "ebs-vol-az" {
  value       = aws_ebs_volume.ebs_vol.availability_zone
  description = "EBS Volume Availability Zone"
}