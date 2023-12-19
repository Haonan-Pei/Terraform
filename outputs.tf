##### EC2 #####
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_rds.instance_id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = module.ec2_rds.instance_arn
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.ec2_rds.instance_private_ip
}

##### RDS #####
output "db_instance_name" {
  description = "AWS RDS Instance Name"
  value       = module.ec2_rds.db_instance_name
}

output "db_instance_arn" {
  description = "AWS RDS Instance ARN"
  value       = module.ec2_rds.arn
}

output "db_instance_status" {
  description = "AWS RDS Instance Status"
  value       = module.ec2_rds.status
}

output "db_instance_engine" {
  description = "AWS RDS Instance Engine"
  value       = module.ec2_rds.engine
}

output "db_instance_engine_version" {
  description = "AWS RDS Instance Engine Version"
  value       = module.ec2_rds.engine_version
}

output "db_instance_multi_az" {
  description = "AWS RDS Multi AZ Status"
  value = module.ec2_rds.multi_az
}

output "db_instance_availability_zone" {
  description = "AWS RDS Multi AZ Status"
  value = module.ec2_rds.availability_zone
}

output "db_instance_port" {
  description = "AWS RDS Instance Port"
  value       = module.ec2_rds.port
}

output "db_instance_endpoint" {
  description = "AWS RDS Instance Endpoint"
  value       = module.ec2_rds.endpoint
}