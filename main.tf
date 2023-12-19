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

module "ec2_rds" {
  source  = "app.terraform.io/eBaoTech/ec2_rds/aws"
  version = "1.0.1"

  allocated_storage = var.allocated_storage
  db_subnet_group_name = var.db_subnet_group_name
  ebs_01_volume_size = var.ebs_01_volume_size
  ebs_02_volume_size = var.ebs_02_volume_size
  engine = var.engine
  engine_version = var.engine_version
  identifier = var.identifier
  instance_class = var.instance_class
  instance_name = var.instance_name
  instance_type = var.instance_type
  key_name = var.key_name
  ec2_kms_key_id = var.ec2_kms_key_id
  rds_kms_key_id = var.rds_kms_key_id
  monitoring_role_arn = var.monitoring_role_arn
  multi_az = var.multi_az
  option_group_name = var.option_group_name
  parameter_group_name = var.parameter_group_name
  password = var.password
  region = var.region
  role_arn = var.role_arn
  root_volume_size = var.root_volume_size
  session_name = var.session_name
  subnet_id = var.subnet_id
  ec2_tags = var.ec2_tags
  rds_tags = var.rds_tags
  username = var.username
  vpc_id = var.vpc_id
  ec2_vpc_security_group_ids = var.ec2_vpc_security_group_ids
  rds_vpc_security_group_ids = var.rds_vpc_security_group_ids
}