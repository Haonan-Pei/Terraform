resource "aws_instance" "aws-terraform-node" {
  ami                     = "ami-06018068a18569ff2"
  instance_type           = "m5.large"
}