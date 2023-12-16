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
  version = "1.0.1"

  ebs_volume_size = "${var.ebs_volume_size}"
  instance_number = "${var.instance_number}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  region = "${var.region}"
  role_arn = "${var.role_arn}"
  root_volume_size = "${var.root_volume_size}"
  session_name = "${var.session_name}"
  subnet_id = "${var.subnet_id}"
  tags = "${var.tags}"
  user_data = "${var.user_data}"
  vpc_security_groups_ids = "${var.vpc_security_groups_ids}"
}