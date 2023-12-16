output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.aws-terraform-node.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.aws-terraform-node.arn
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.aws-terraform-node.private_ip
}