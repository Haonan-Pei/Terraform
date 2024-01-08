output "aws-sg-mis-tfc-test-node_instance_id" {
  description = "ID of the EC2 instance"
  value = try(
    module.aws-sg-mis-tfc-test-node[0].id,
    null,
  )
}

output "aws-sg-mis-tfc-test-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = try(
    module.aws-sg-mis-tfc-test-node[0].arn,
    null,
  )
}

output "aws-sg-mis-tfc-test-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = try(
    module.aws-sg-mis-tfc-test-node[*].private_ip,
    null,
  )
}

output "aws-sg-mis-tfc-prod-node_instance_id" {
  description = "ID of the EC2 instance"
  value = try(
    module.aws-sg-mis-tfc-prod-node[*].id,
    null,
  )
}

output "aws-sg-mis-tfc-prod-node_instance_arn" {
  description = "ARN of the EC2 instance"
  value = try(
    module.aws-sg-mis-tfc-prod-node[*].arn,
    null,
  )
}

output "aws-sg-mis-tfc-prod-node_instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value = try(
    module.aws-sg-mis-tfc-prod-node[*].private_ip,
    null,
  )
}