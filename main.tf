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
data "aws_subnets" "aws-private-subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    type = "private"
  }
}

resource "aws_instance" "aws-terraform-node-without-module" {
  count = length(var.name)
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type

  availability_zone = tolist(data.aws_availability_zones.aws-az.zone_ids)[count.index % length(data.aws_availability_zones.aws-az.zone_ids))
  subnet_id       = tolist(data.aws_subnets.aws-private-subnet.ids)[count.index % length(data.aws_subnets.aws-private-subnet.ids)]
  vpc_security_group_ids = [var.vpc_security_group_ids]
  root_block_device {
    encrypted             = "true"
    volume_type           = "gp3"
    volume_size           = var.root_volume_size
    delete_on_termination = "true"
  }

  ebs_block_device {
    encrypted             = "true"
    device_name           = "/dev/sdb"
    volume_type           = "gp3"
    volume_size           = var.ebs_volume_size
    delete_on_termination = "true"
  }

  key_name  = var.key_name

  tags = merge({ "Name" = var.name[count.index] }, var.tags)
}