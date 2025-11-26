output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.this.public_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.this.id
}

output "key_pair_name" {
  description = "Name of the key pair used"
  value       = var.create_key_pair ? aws_key_pair.this[0].key_name : var.key_name
}
