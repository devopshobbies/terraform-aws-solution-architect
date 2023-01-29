## Requirements

| Name | Version |
|------|---------|
|terraform| >= 1.0 |
|aws| >= 4.0 |

## Providers

| Name | Version |
|------|---------|
|aws| >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
|aws_ebs_volume.ebs_vol| resource |
|aws_volume_attachment.ebs_vol_att| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|availability\_zone| EBS Availability Zone (Must Be Same As EC2 AZ) | `string` | n/a | yes |
|ebs\_device\_name| Name of EBS Device | `string` | n/a | yes |
|ebs\_vol\_size| EBS Volume Size | `number` | n/a | yes |
|encrypt\_ebs| EBS Encryption Status | `bool` | n/a | yes |
|instance\_id| Corresponding Instance ID For EBS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
|ebs-vol-arn| EBS Volume ARN |
|ebs-vol-az| EBS Volume Availability Zone |
|ebs-vol-size| EBS Volume Size |
|ebs-vol-type| EBS Volume Type |