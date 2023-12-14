terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
    region     = vars.region
    access_key = vars.access_key
    secret_key = vars.secret_key
    token      = vars.token
}

data "aws_ami" "centos" {
  most_recent = true
    
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "aws-terraform-node" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type

  subnet_id       = var.subnet_id
  security_groups = var.vpc_security_group_ids
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
}