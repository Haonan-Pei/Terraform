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

module "aws-sg-mis-tfc-test-node1" {
  source  = "app.terraform.io/eBaoTech/ec2-instance/aws"
  version = "1.0.1"

  # Credential
  region       = "ap-southeast-1"
  role_arn     = "arn:aws:iam::792805611202:role/AWS-TFC-Test-Role"
  session_name = "AWS-Test-Account"

  # EC2 Instance
  instance_name  = "aws-sg-mis-tfc-test-node1"
  instance_type  = "t3.micro"
  key_name       = "aws-terraform-node"
  kms_key_id     = "arn:aws:kms:ap-southeast-1:792805611202:key/db436907-6f13-4bf8-8fad-f96aef6c31c7"

  # Network
  vpc_id                 = "vpc-0f286b87f6440d569"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = "sg-08f226bd7393db216"

  # Storage
  root_volume_size   = 20
  ebs_01_volume_size = 30
  ebs_02_volume_size = 40

  ec2_tags = var.ec2_tags
}

module "aws-sg-mis-tfc-test-node2" {
  source  = "app.terraform.io/eBaoTech/ec2-instance/aws"
  version = "1.0.1"

  # Credential
  region       = "ap-southeast-1"
  role_arn     = "arn:aws:iam::792805611202:role/AWS-TFC-Test-Role"
  session_name = "AWS-Test-Account"

  # EC2 Instance
  instance_name  = "aws-sg-mis-tfc-test-node2"
  instance_type  = "t3.medium"
  key_name       = "aws-terraform-node"
  kms_key_id     = "arn:aws:kms:ap-southeast-1:792805611202:key/db436907-6f13-4bf8-8fad-f96aef6c31c7"

  # Network
  vpc_id                     = "vpc-0f286b87f6440d569"
  subnet_id                  = var.subnet_id
  vpc_security_group_ids     = "sg-08f226bd7393db216"

  # Storage
  root_volume_size   = 20
  ebs_01_volume_size = 50
  ebs_02_volume_size = 80

  ec2_tags = var.ec2_tags
}