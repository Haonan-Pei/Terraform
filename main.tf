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
  version = "1.0.2"

  ebs_volume_size = module.ebs_volume_size
  instance_number = module.instance_number
  instance_type = module.instance_type
  key_name = module.key_name
  region = module.region
  role_arn = module.role_arn
  root_volume_size = module.root_volume_size
  session_name = module.session_name
  subnet_id = module.subnet_id
  tags = module.tags
  vpc_security_groups_ids = [module.vpc_security_groups_ids]
}