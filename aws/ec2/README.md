# AWS EC2 Module

A reusable Terraform module to deploy EC2 instances with:

- Optional key pair creation
- Security group (SSH by default, optional HTTP)
- Custom AMI, instance type, subnet, VPC
- Public or private instance
- Tagging support

---

## Features

- Launch an EC2 instance
- Create a security group with:
  - SSH allowed from configurable CIDR ranges
  - Optional HTTP rule
- Create OR reuse an existing AWS key pair
- Output instance details

---

## Usage Example

```hcl
module "ec2" {
  source = "github.com/xiomaragonzalezgonzalez/Terraform-Modules-Library/aws/ec2"

  name          = "demo-ec2"
  ami_id        = "ami-0abcdef1234567890"
  instance_type = "t2.micro"

  subnet_id = "subnet-123456789"
  vpc_id    = "vpc-123456789"

  create_key_pair = true
  public_key      = file("~/.ssh/id_rsa.pub")
  key_name        = "my-demo-key"

  enable_http = true

  tags = {
    Project = "TerraformModules"
    Owner   = "Xiomara"
  }
}
