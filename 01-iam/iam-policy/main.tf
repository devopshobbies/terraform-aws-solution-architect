provider "aws" {
  region = var.region
}

module "iam_policy" {
  source = "../../modules/01-iam/iam-policy"

  name        = var.name
  path        = var.path
  description = "S3 bucket Read-Only policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket",
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::*"
    }
  ]
}
EOF

  tags = {
    PolicyDescription = "Policy created using Terraform by user"
  }
}