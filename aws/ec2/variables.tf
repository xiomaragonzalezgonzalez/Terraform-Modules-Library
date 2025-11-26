variable "name" {
  description = "Name prefix for resources"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security group creation"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP with the instance"
  type        = bool
  default     = true
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_http" {
  description = "Enable HTTP ingress rule"
  type        = bool
  default     = false
}

variable "http_cidr_blocks" {
  description = "CIDR blocks allowed for HTTP access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# -----------------------------
# Key Pair Options
# -----------------------------
variable "create_key_pair" {
  description = "Whether to create a new key pair"
  type        = bool
  default     = false
}

variable "public_key" {
  description = "Public key to import if create_key_pair = true"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Existing key pair name OR new key name if create_key_pair = true"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
