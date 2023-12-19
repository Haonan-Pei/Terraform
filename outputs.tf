output "db_instance_name" {
  description = "AWS RDS Instance Name"
  value       = aws_db_instance.aws-terraform-rds.identifier
}

output "db_instance_arn" {
  description = "AWS RDS Instance ARN"
  value       = aws_db_instance.aws-terraform-rds.arn
}

output "db_instance_status" {
  description = "AWS RDS Instance Status"
  value       = aws_db_instance.aws-terraform-rds.status
}

output "db_instance_engine" {
  description = "AWS RDS Instance Engine"
  value       = aws_db_instance.aws-terraform-rds.engine
}

output "db_instance_engine_version" {
  description = "AWS RDS Instance Engine Version"
  value       = aws_db_instance.aws-terraform-rds.engine_version
}

output "db_instance_multi_az" {
  description = "AWS RDS Multi AZ Status"
  value = aws_db_instance.aws-terraform-rds.multi_az
}

output "db_instance_availability_zone" {
  description = "AWS RDS Multi AZ Status"
  value = aws_db_instance.aws-terraform-rds.availability_zone
}

output "db_instance_port" {
  description = "AWS RDS Instance Port"
  value       = aws_db_instance.aws-terraform-rds.port
}

output "db_instance_endpoint" {
  description = "AWS RDS Instance Endpoint"
  value       = aws_db_instance.aws-terraform-rds.endpoint
}