terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

module "ec2instance" {
  source  = "app.terraform.io/Haonan-Pei/ec2instance/aws"
  version = "1.0.12"

  region = var.region
  instance_number = var.instance_number
  vpc_security_group_ids = [var.vpc_security_group_ids]
  role_arn     = var.role_arn
  session_name = var.session_name
  instance_type = var.instance_type
  subnet_id       = var.subnet_id
  root_volume_size = var.root_volume_size
  ebs_volume_size  = var.ebs_volume_size
  key_name  = var.key_name
  tags = var.tags
}