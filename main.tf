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
  version = "1.0.7"

  region = module.region
  instance_number = module.instance_number
  vpc_security_group_ids = module.vpc_security_group_ids
  role_arn     = module.role_arn
  session_name = module.session_name
  instance_type = module.instance_type
  subnet_id       = module.subnet_id
  root_volume_size = module.root_volume_size
  ebs_volume_size  = module.ebs_volume_size
  key_name  = module.key_name
  tags = module.tags
}