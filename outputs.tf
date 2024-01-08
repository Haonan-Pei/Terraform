output "aws-sg-mis-tfc-test-node_instance_id" {
  description = "ID of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-test-node : i.id
  ]
}

output "aws-sg-mis-tfc-test-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-test-node : i.arn
  ]
}

output "aws-sg-mis-tfc-test-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-test-node : i.private_ip
  ]
}

output "aws-sg-mis-tfc-prod-node_instance_id" {
  description = "ID of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-prod-node : i.id
  ]
}

output "aws-sg-mis-tfc-prod-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-prod-node : i.arn
  ]
}

output "aws-sg-mis-tfc-prod-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-prod-node : i.private_ip
  ]
}