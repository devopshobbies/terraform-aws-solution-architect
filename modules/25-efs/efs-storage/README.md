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
|aws_efs_file_system.efs_fs| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|availability\_zone\_name| Avalability zone name (used for one zone efs). | `string` | `null` | no |
|encryption| EFS encryption status. | `bool` | n/a | yes |
|infrequent\_access\_transition\_dur| How long it takes to transition files to the IA storage class. | `string` | n/a | yes |
|performance\_mode| The file system performance mode. | `string` | `"generalPurpose"` | no |
|provisioned\_throughput\_in\_mibps\_val| The throughput, measured in MiB/s, that you want to provision for the file system. | `number` | `10` | no |
|tag\_name| EFS tag name. | `string` | n/a | yes |
|throughput\_mode| Throughput mode for the file system. | `string` | `"provisioned"` | no |
|token\_name| A unique name used as reference when creating the Elastic File System to ensure idempotent file system creation. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
|efs\_availability\_zone\_name| Availability zone name |
|efs\_encryption\_status| Encryption status |
|efs\_lifecycle\_policy| Lifecycle policy |
|efs\_performance\_mode| Performance mode |
|efs\_throughput\_mode| Throughput mode |
|efs\_token\_name| Token name |