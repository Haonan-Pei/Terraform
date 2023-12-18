output "db_instance_name" {
  description = "AWS RDS Instance Name"
  value       = aws_db_instance.aws-terraform-rds.db_instance_name
}

output "db_instance_arn" {
  description = "AWS RDS Instance ARN"
  value       = aws_db_instance.aws-terraform-rds.db_instance_arn
}

output "db_instance_status" {
  description = "AWS RDS Instance Status"
  value       = aws_db_instance.aws-terraform-rds.db_instance_status
}

output "db_instance_engine" {
  description = "AWS RDS Instance Engine"
  value       = aws_db_instance.aws-terraform-rds.db_instance_engine
}

output "db_instance_engine_version_actual" {
  description = "AWS RDS Instance Engine Version"
  value       = aws_db_instance.aws-terraform-rds.db_instance_engine_version_actual
}

output "db_instance_port" {
  description = "AWS RDS Instance Port"
  value       = aws_db_instance.aws-terraform-rds.db_instance_port
}

output "db_instance_endpoint" {
  description = "AWS RDS Instance Endpoint"
  value       = aws_db_instance.aws-terraform-rds.db_instance_endpoint
}