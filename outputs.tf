output "aws-sg-mis-tfc-test-node_instance_id" {
  description = "ID of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-test-node : i.instance_id
  ]
}

output "aws-sg-mis-tfc-test-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-test-node : i.instance_arn
  ]
}

output "aws-sg-mis-tfc-test-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-test-node : i.instance_private_ip
  ]
}

output "aws-sg-mis-tfc-prod-node_instance_id" {
  description = "ID of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-prod-node : i.instance_id
  ]
}

output "aws-sg-mis-tfc-prod-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-prod-node : i.instance_id
  ]
}

output "aws-sg-mis-tfc-prod-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = [
    for i in module.aws-sg-mis-tfc-prod-node : i.instance_id
  ]
}