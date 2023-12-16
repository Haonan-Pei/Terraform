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

  region = module.ec2instance.region
  instance_number = module.ec2instance.instance_number
  vpc_security_group_ids = module.ec2instance.vpc_security_group_ids
  role_arn     = module.ec2instance.role_arn
  session_name = module.ec2instance.session_name
  instance_type = module.ec2instance.instance_type
  subnet_id       = module.ec2instance.subnet_id
  root_volume_size = module.ec2instance.root_volume_size
  ebs_volume_size  = module.ec2instance.ebs_volume_size
  key_name  = module.ec2instance.key_name
  tags = module.ec2instance.tags
}