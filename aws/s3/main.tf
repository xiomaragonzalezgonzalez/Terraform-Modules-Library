variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type        = string
}

variable "acl" {
  description = "Canned ACL to apply to the bucket (default private)"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm (AES256 or aws:kms)"
  type        = string
  default     = "AES256"
  validation {
    condition     = contains(["AES256","aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be either 'AES256' or 'aws:kms'"
  }
}

variable "kms_key_id" {
  description = "(Optional) KMS key ARN or ID when sse_algorithm = aws:kms"
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "Allow Terraform to destroy bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to apply"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner tag value"
  type        = string
  default     = "Xiomara"
}

variable "block_public_acls" {
  type    = bool
  default = true
}

variable "block_public_policy" {
  type    = bool
  default = true
}

variable "ignore_public_acls" {
  type    = bool
  default = true
}

variable "restrict_public_buckets" {
  type    = bool
  default = true
}

variable "force_tls" {
  description = "If true, create a bucket policy that denies non-TLS requests"
  type        = bool
  default     = true
}

variable "enable_access_logs" {
  description = "If true, write access logs to the bucket specified in access_log_bucket_name"
  type        = bool
  default     = false
}

variable "access_log_bucket_name" {
  description = "Existing bucket name to receive access logs"
  type        = string
  default     = ""
}

variable "lifecycle_rules" {
  description = "Map of lifecycle rule objects. Use an empty map {} to disable."
  type = map(object({
    id               = optional(string)
    enabled          = optional(bool, true)
    prefix           = optional(string)
    transition_days  = optional(number)
    transition_class = optional(string)
    expiration_days  = optional(number)
  }))
  default = {}
}
