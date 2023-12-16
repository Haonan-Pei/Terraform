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

  region = var.region
}