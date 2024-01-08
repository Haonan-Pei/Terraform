variable "region" {
  description = "AWS Region"
}

variable "role_arn" {
    description = "AWS IAM Role ARN"
}

variable "session_name" {
    description = "AWS IAM Role Session Name"
}

variable "instance_name" {
  description = "AWS Instance Number"
  type = list(string)
}

variable "instance_type" {
  description = "AWS EC2 Instance Type"
}

variable "key_name" {
  description = "AWS Key Pair"
}

variable "kms_key_id" {
  description = "AWS KMS Key ID"
}
variable "root_volume_size" {
  description = "AWS EC2 Root Volume Size"
}

variable "ebs_01_volume_size" {
  description = "AWS EC2 Data Volume 01 Size"
}

variable "ebs_02_volume_size" {
  description = "AWS EC2 Data Volume 01 Size"
}

variable "vpc_id" {
  description = "AWS VPC ID"
}

variable "subnet_id" {
  description = "AWS Subnet ID"
}

variable "vpc_security_group_ids" {
  description = "AWS Security Group ID"
}

variable "ec2_tags" {
  description = "AWS Tags"
  type = map(string)
}