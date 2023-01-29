provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "objects" {
  description             = "KMS Key For Encrypting Bucket Objects"
  deletion_window_in_days = 10
}

module "log_bucket" {
  source = "../../modules/04-s3bucket/s3bucket-bucket"

  bucket        = "logs-bucket-s3-terraform-test"
  acl           = "log-delivery-write"
  force_destroy = true
}

module "s3_bucket" {
  source = "../../modules/04-s3bucket/s3bucket-bucket"

  bucket = var.bucket_name

  force_destroy       = true
  acceleration_status = "Suspended" # Enabled or Suspended
  request_payer       = "BucketOwner"


  object_lock_enabled = true
  object_lock_configuration = {
    rule = {
      default_retention = {
        mode = "GOVERNANCE"
        days = 1
      }
    }
  }

  expected_bucket_owner = data.aws_caller_identity.current.account_id

  acl = "private" # "acl" conflicts with "grant" and "owner" (access_control_policy block)

  logging = {
    target_bucket = module.log_bucket.s3_bucket_id # Creating a separate bucket for logging is mandetory.
    target_prefix = "log/"
  }

  versioning = {
    status     = true
    mfa_delete = false
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  lifecycle_rule = [
    {
      id      = "test-1"
      enabled = true

      filter = {
        tags = {
          key1 = "value1"
          key2 = "value2"
        }
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
          }, {
          days          = 60
          storage_class = "GLACIER"
          }, {
          days          = 150
          storage_class = "DEEP_ARCHIVE"
        }


      ]

      expiration = {
        days                         = 180
        expired_object_delete_marker = true
      }

      noncurrent_version_expiration = {
        newer_noncurrent_versions = 5
        days                      = 30
      }
    },
    {
      id                                     = "test-2"
      enabled                                = true
      abort_incomplete_multipart_upload_days = 7

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 60
          storage_class = "ONEZONE_IA"
        },
        {
          days          = 90
          storage_class = "GLACIER"
          }, {
          days          = 180
          storage_class = "DEEP_ARCHIVE"
        }
      ]

      noncurrent_version_expiration = {
        days = 300
      }
    },
    {
      id      = "test-3"
      enabled = true

      filter = {
        prefix                   = "log/"
        object_size_greater_than = 200000 # byte
        object_size_less_than    = 500000 # byte
        tags = {
          key1 = "value1"
          key2 = "value2"
        }
      }

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
      ]

      noncurrent_version_expiration = {
        days = 300
      }
    },
  ]

}