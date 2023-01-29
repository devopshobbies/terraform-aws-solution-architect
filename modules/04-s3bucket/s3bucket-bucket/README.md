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
|aws_s3_bucket.s3-bucket| resource |
|aws_s3_bucket_accelerate_configuration.s3-bucket-accelerate-config| resource |
|aws_s3_bucket_acl.s3-bukcet-acl| resource |
|aws_s3_bucket_lifecycle_configuration.s3-bucket-lifecycle| resource |
|aws_s3_bucket_logging.s3-bucket-log| resource |
|aws_s3_bucket_object_lock_configuration.s3-bucket-object-lock| resource |
|aws_s3_bucket_request_payment_configuration.s3-bucket-payment| resource |
|aws_s3_bucket_server_side_encryption_configuration.s3-bucket-sse-kms| resource |
|aws_s3_bucket_versioning.s3-bucket-versioning| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|acceleration\_status| (Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended. | `string` | `null` | no |
|acl| (Optional) The canned ACL to apply. Conflicts with `grant` | `string` | `null` | no |
|bucket| (Optional, Forces New Resource) The Name Of The Bucket. If Omitted, Terraform Will Assign A Random, Unique Name | `string` | `"my-bucket"` | no |
|bucket\_prefix| (Optional, Forces New Resource) Creates A Unique Bucket Name Beginning With The Specified Prefix. Conflicts With Bucket | `string` | `null` | no |
|create\_bucket| Controls If S3 Bucket Should Be Created | `bool` | `true` | no |
|expected\_bucket\_owner| The account ID of the expected bucket owner | `string` | `null` | no |
|force\_destroy| (Optional, Default:False ) A Boolean That Indicates All Objects Should Be Deleted From The Bucket So That The Bucket Can Be Destroyed Without Error. These Objects Are Not Recoverable | `bool` | `false` | no |
| lifecycle\_rule| List of maps containing configuration of object lifecycle management. | `any` | `[]` | no |
|logging| Map containing access bucket logging configuration. | `map(string)` | `{}` | no |
| object\_lock\_configuration| Map containing S3 object locking configuration. | `any` | `{}` | no |
|object\_lock\_enabled| Whether S3 Bucket Should Have An Object Lock Configuration Enabled | `bool` | `false` | no |
|request\_payer| (Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information. | `string` | `null` | no |
| server\_side\_encryption\_configuration| Map containing server-side encryption configuration. | `any` | `{}` | no |
|versioning| Map containing versioning configuration. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
|s3\_bucket\_arn| The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
|s3\_bucket\_bucket\_domain\_name| The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
|s3\_bucket\_hosted\_zone\_id| The Route 53 Hosted Zone ID for this bucket's region. |
|s3\_bucket\_id| The name of the bucket. |
|s3\_bucket\_region| The AWS region this bucket resides in. |