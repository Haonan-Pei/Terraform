terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
    region     = var.region
    assume_role {
      role_arn     = var.role_arn
      session_name = var.session_name
    }
}

resource "aws_db_instance" "aws-terraform-rds" {
    identifier                      = var.identifier
    engine                          = var.engine
    engine_version                  = var.engine_version
    instance_class                  = var.instance_class

    availability_zone               = var.availability_zone
    multi_az                        = var.multi_az
    username                        = var.username
    password                        = var.password
    vpc_security_group_ids          = [var.vpc_security_group_ids]
    db_subnet_group_name            = var.db_subnet_group_name
    parameter_group_name            = var.parameter_group_name
    option_group_name               = var.option_group_name
    monitoring_interval             = 60
    kms_key_id                      = var.kms_key_id
    storage_encrypted               = true
    storage_type                    = "gp3"
    allocated_storage               = var.allocated_storage
    deletion_protection             = true
    backup_retention_period         = 35
    monitoring_role_arn             = var.monitoring_role_arn
    copy_tags_to_snapshot           = true
    enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
    auto_minor_version_upgrade      = false
    skip_final_snapshot             = false

    tags = merge({ "Name" = var.identifier }, var.tags)
}