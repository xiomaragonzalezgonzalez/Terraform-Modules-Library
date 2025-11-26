# AWS S3 Module

A reusable Terraform module to create secure AWS S3 buckets with:
- Versioning (optional)
- Server-side encryption (SSE-S3 or KMS)
- Lifecycle rules support
- Public access block by default
- Optional access logging & TLS-only policy

## Requirements
- Terraform >= 1.3
- AWS provider >= 5.0
- IAM user/role with permissions: s3:CreateBucket, s3:PutBucketEncryption, s3:PutBucketLifecycle, s3:PutBucketPolicy, s3:PutBucketLogging, s3:PutBucketVersioning

## Usage example
```hcl
module "s3" {
  source = "github.com/xiomaragonzalezgonzalez/Terraform-Modules-Library//aws/s3"

  bucket_name = "xiomara-demo-bucket-12345"
  acl         = "private"
  versioning  = true

  sse_algorithm = "AES256"
  kms_key_id    = "" 

  force_destroy = false

  tags = {
    Project = "CloudModules"
    Team    = "Platform"
  }

  lifecycle_rules = {
    rule1 = {
      id               = "transition-to-glacier"
      enabled          = true
      prefix           = ""
      transition_days  = 30
      transition_class = "GLACIER"
      expiration_days  = 365
    }
  }

  enable_access_logs    = false
  access_log_bucket_name = ""
}
