variable "region" {
  description = "AWS Region"
}

variable "role_arn" {
  description = "AWS IAM Role ARN"
}

variable "session_name" {
  description = "AWS IAM Role Session Name"
}

variable "instance_number" {
  description = "Number"
}

variable "instance_type" {
  description = "AWS EC2 Instance Type"
}

variable "key_name" {
  description = "AWS Key Pair"
}

variable "root_volume_size" {
  description = "AWS EC2 Root Volume Size"
}

variable "ebs_volume_size" {
  description = "AWS EC2 Data Volume Size"
}

variable "subnet_id" {
  description = "AWS Subnet ID"
}

variable "vpc_security_group_ids" {
  description = "AWS Security Group ID"
}

variable "tags" {
  description = "AWS Tags"
  type = map(string)
}