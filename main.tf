module "ec2_instance" {
  source  = "app.terraform.io/eBaoTech/ec2-instance/aws"
  version = "1.0.0"
  # insert required variables here

  # Credential
  region = var.region
  role_arn     = var.role_arn
  session_name = var.session_name

  # EC2 Instance
  instance_name  = var.instance_name
  instance_type  = var.instance_type
  key_name       = var.key_name
  ec2_kms_key_id = var.ec2_kms_key_id

  # Network
  vpc_id                     = var.vpc_id
  subnet_id                  = var.subnet_id
  ec2_vpc_security_group_ids = var.ec2_vpc_security_group_ids

  # Storage
  root_volume_size   = var.root_volume_size
  ebs_01_volume_size = var.ebs_01_volume_size
  ebs_02_volume_size = var.ebs_02_volume_size

  ec2_tags = var.ec2_tags
}