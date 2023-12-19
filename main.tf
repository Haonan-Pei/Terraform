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

variable "allocated_storage" {}
variable "db_subnet_group_name" {}
variable "ebs_01_volume_size" {}
variable "ebs_02_volume_size" {}
variable "engine" {}
variable "engine_version" {}
variable "identifier" {}
variable "instance_class" {}
variable "instance_name" {}
variable "instance_type" {}
variable "key_name" {}
variable "kms_key_id" {}
variable "monitoring_role_arn" {}
variable "multi_az" {}
variable "option_group_name" {}
variable "parameter_group_name" {}
variable "password" {}
variable "region" {}
variable "role_arn" {}
variable "root_volume_size" {}
variable "session_name" {}
variable "subnet_id" {}
variable "tags" {}
variable "username" {}
variable "vpc_id" {}
variable "vpc_security_group_ids" {}

module "ec2_rds" {
  source  = "app.terraform.io/eBaoTech/ec2_rds/aws"
  version = "1.0.0"

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
  kms_key_id = var.kms_key_id
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
  tags = var.tags
  username = var.username
  vpc_id = var.vpc_id
  vpc_security_group_ids = var.vpc_security_group_ids
}