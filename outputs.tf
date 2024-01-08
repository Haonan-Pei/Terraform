output "aws-sg-mis-tfc-test-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = module.aws-sg-mis-tfc-test-node.arn
}

output "aws-sg-mis-tfc-test-node_instance_private_dns" {
  description = "Private IP address of the EC2 instance"
  value = module.aws-sg-mis-tfc-test-node.private_dns
}

output "aws-sg-mis-tfc-prod-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = module.aws-sg-mis-tfc-prod-node.arn
}

output "aws-sg-mis-tfc-prod-node_instance_private_dns" {
  description = "Private IP address of the EC2 instance"
  value = module.aws-sg-mis-tfc-prod-node.private_dns
}