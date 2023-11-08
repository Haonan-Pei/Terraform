############################### RDS ###############################
resource "aws_db_instance" "aws-terraform-rds" {
  count = length(local.vars.rds)

  identifier             = local.vars.rds[count.index].identifier

  engine                 = local.vars.rds[count.index].engine
  engine_version         = local.vars.rds[count.index].engine_version
  instance_class         = local.vars.rds[count.index].instance_class
  multi_az               = local.vars.rds[count.index].multi_az

  username               = local.vars.rds[count.index].username
  password               = local.vars.rds[count.index].password

  storage_type           = local.vars.rds[count.index].storage_type
  allocated_storage      = local.vars.rds[count.index].allocated_storage
  storage_encrypted      = local.vars.rds[count.index].storage_encrypted
  kms_key_id             = local.vars.rds[count.index].kms_key_id

  db_subnet_group_name   = local.vars.rds[count.index].db_subnet_group_name
  vpc_security_group_ids = local.vars.rds[count.index].vpc_security_group_ids

  parameter_group_name   = local.vars.rds[count.index].parameter_group_name
  option_group_name      = local.vars.rds[count.index].option_group_name

  performance_insights_enabled             = local.vars.rds[count.index].performance_insights_enabled
  performance_insights_kms_key_id          = local.vars.rds[count.index].performance_insights_kms_key_id
  performance_insights_retention_period    = local.vars.rds[count.index].performance_insights_retention_period

  monitoring_interval             = local.vars.rds[count.index].monitoring_interval
  monitoring_role_arn             = local.vars.rds[count.index].monitoring_role_arn
    
  backup_retention_period         = local.vars.rds[count.index].backup_retention_period
  copy_tags_to_snapshot           = local.vars.rds[count.index].copy_tags_to_snapshot
  enabled_cloudwatch_logs_exports = local.vars.rds[count.index].enabled_cloudwatch_logs_exports
  auto_minor_version_upgrade      = local.vars.rds[count.index].auto_minor_version_upgrade
  skip_final_snapshot             = local.vars.rds[count.index].skip_final_snapshot
  deletion_protection             = local.vars.rds[count.index].deletion_protection

  tags                            = local.vars.rds[count.index].tags
}
