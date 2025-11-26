terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# -------------------------
# Optional Key Pair
# -------------------------
resource "aws_key_pair" "this" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = var.key_name
  public_key = var.public_key
}

# -------------------------
# Security Group
# -------------------------
resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security Group for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  # Optional HTTP rule
  dynamic "ingress" {
    for_each = var.enable_http ? [1] : []
    content {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = var.http_cidr_blocks
    }
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.name}-sg"
    },
    var.tags
  )
}

# -------------------------
# EC2 Instance
# -------------------------
resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]

  # Use created key pair OR existing key pair name
  key_name = var.create_key_pair ? aws_key_pair.this[0].key_name : var.key_name

  associate_public_ip_address = var.associate_public_ip

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
