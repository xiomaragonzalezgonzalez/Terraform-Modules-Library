# Terraform Modules Library

A curated collection of reusable, production-ready Terraform modules for deploying infrastructure on **AWS** and **Azure**. This library is designed to help cloud engineers accelerate development, enforce consistency, and follow best practices across cloud environments.

## 📦 Modules Included

### AWS
- `ec2`: Launch and configure EC2 instances with security groups and key pairs.
- `s3`: Create S3 buckets with versioning, encryption, and lifecycle policies.

### Azure
- `storage_account`: Provision Azure Storage Accounts with network rules and replication options.
- `virtual_network`: Deploy Azure Virtual Networks with subnets, route tables, and NSGs.

## 🚀 Getting Started

Each module is self-contained and includes:
- `main.tf`: Core logic
- `variables.tf`: Input variables
- `outputs.tf`: Output values
- `README.md`: Usage instructions
