output "aws-sg-mis-tfc-test-node_instance_id" {
  description = "ID of the EC2 instance"
  value = module.aws-sg-mis-tfc-test-node[0].id
}

output "aws-sg-mis-tfc-test-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = module.aws-sg-mis-tfc-test-node[0].arn
}

output "aws-sg-mis-tfc-test-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = module.aws-sg-mis-tfc-test-node[0].private_ip
}

output "aws-sg-mis-tfc-prod-node_instance_id" {
  description = "ID of the EC2 instance"
  value = module.aws-sg-mis-tfc-prod-node[0].id
}

output "aws-sg-mis-tfc-prod-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = module.aws-sg-mis-tfc-prod-node[0].arn
}

output "aws-sg-mis-tfc-prod-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
value = module.aws-sg-mis-tfc-prod-node[0].private_ip
}