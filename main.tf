terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

variable "ec2instance_ebs_volume_size" {}
variable "ec2instance_instance_number" {}
variable "ec2instance_instance_type" {}
variable "ec2instance_key_name" {}
variable "ec2instance_region" {}
variable "ec2instance_role_arn" {}
variable "ec2instance_root_volume_size" {}
variable "ec2instance_session_name" {}
variable "ec2instance_subnet_id" {}
variable "ec2instance_tags" {}
variable "ec2instance_vpc_security_group_ids" {}

module "ec2instance" {
  source  = "app.terraform.io/Haonan-Pei/ec2instance/aws"
  version = "1.0.7"

  ebs_volume_size = "${var.ec2instance_ebs_volume_size}"
  instance_number = "${var.ec2instance_instance_number}"
  instance_type = "${var.ec2instance_instance_type}"
  key_name = "${var.ec2instance_key_name}"
  region = "${var.ec2instance_region}"
  role_arn = "${var.ec2instance_role_arn}"
  root_volume_size = "${var.ec2instance_root_volume_size}"
  session_name = "${var.ec2instance_session_name}"
  subnet_id = "${var.ec2instance_subnet_id}"
  tags = "${var.ec2instance_tags}"
  vpc_security_group_ids = "${var.ec2instance_vpc_security_group_ids}"
}