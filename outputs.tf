output "instance_id" {
  description = "ID of the EC2 instance"
  value       = try(
    aws_instance.aws-terraform-node[0].id,
    null,
  )
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = try(
    aws_instance.aws-terraform-node[0].arn,
    null,
  )
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = try(
    aws_instance.aws-terraform-node[0].private_ip,
    null,
  )
}