terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}
module "ec2_instance" {
  source  = "app.terraform.io/Haonan-Pei/ec2-instance/aws"
  version = "1.0.1"
}