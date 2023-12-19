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

##### EC2 #####
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"]
}

data "aws_vpc" "aws-vpc" {
  id = var.vpc_id
}

data "aws_availability_zones" "aws-az" {
  filter {
    name   = "region-name"
    values = [var.region]
  }
}
data "aws_subnets" "aws-private-subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    type = "private"
  }
}

data "aws_subnet" "aws-private-subnet" {
  count = length(data.aws_subnets.aws-private-subnets.ids)
  id    = data.aws_subnets.aws-private-subnets.ids[count.index]
}

locals {
  ids_sorted_by_az = values(zipmap(data.aws_subnet.aws-private-subnet.*.availability_zone, data.aws_subnet.aws-private-subnet.*.id))
}

resource "aws_instance" "aws-terraform-node" {
  count = length(var.instance_name)
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  subnet_id       = local.ids_sorted_by_az[count.index % length(local.ids_sorted_by_az)]
  vpc_security_group_ids = [var.vpc_security_group_ids]
  root_block_device {
    encrypted             = "true"
    volume_type           = "gp3"
    volume_size           = var.root_volume_size
    delete_on_termination = "false"
    kms_key_id            = var.kms_key_id
  }

  ebs_block_device {
    encrypted             = "true"
    device_name           = "/dev/sdb"
    volume_type           = "gp3"
    volume_size           = var.ebs_01_volume_size
    delete_on_termination = "false"
    kms_key_id            = var.kms_key_id
  }

  ebs_block_device {
    encrypted             = "true"
    device_name           = "/dev/sdc"
    volume_type           = "gp3"
    volume_size           = var.ebs_02_volume_size
    delete_on_termination = "false"
    kms_key_id            = var.kms_key_id
  }

  key_name  = var.key_name

  disable_api_termination = "true"
  disable_api_stop        = "true"

  tags = merge({ "Name" = var.instance_name[count.index] }, var.tags)
}

##### RDS #####
resource "aws_db_instance" "aws-terraform-rds" {
    identifier                      = var.identifier
    engine                          = var.engine
    engine_version                  = var.engine_version
    instance_class                  = var.instance_class

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