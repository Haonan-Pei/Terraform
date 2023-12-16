output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2instance.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = module.ec2instance.arn
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.ec2instance.instance_private_ip
}