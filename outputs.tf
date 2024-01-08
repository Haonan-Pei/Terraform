output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.aws-sg-mis-tfc-test-node1.instance_id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = module.ec2_instance.instance_arn
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.ec2_instance.instance_private_ip
}