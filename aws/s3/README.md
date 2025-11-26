# AWS S3 Module

This module deploys an AWS S3 bucket.

## Example

```hcl
module "s3" {
  source      = "github.com/xiomaragonzalezgonzalez/Terraform-Modules-Library/aws/s3"
  bucket_name = "my-demo-bucket"
}
