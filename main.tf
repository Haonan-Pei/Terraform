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
  count = length(var.instance_number)
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  subnet_id       = local.ids_sorted_by_az[count.index % length(local.ids_sorted_by_az)]
  vpc_security_group_ids = [var.vpc_security_group_ids]
  root_block_device {
    encrypted             = "true"
    volume_type           = "gp3"
    volume_size           = var.root_volume_size
    delete_on_termination = "true"
    kms_key_id            = var.kms_key_id
  }

  ebs_block_device {
    encrypted             = "true"
    device_name           = "/dev/sdb"
    volume_type           = "gp3"
    volume_size           = var.ebs_volume_size
    delete_on_termination = "true"
    kms_key_id            = var.kms_key_id
  }

  key_name  = var.key_name

  disable_api_termination = "true"
  disable_api_stop        = "true"

  tags = merge({ "Name" = var.instance_name[count.index] }, var.tags)
}