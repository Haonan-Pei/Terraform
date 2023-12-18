output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.aws-terraform-node[count.index].id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.aws-terraform-node[count.index].arn
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.aws-terraform-node[count.index].private_ip
}