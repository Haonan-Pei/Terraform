variable "region" {
  description = "AWS Region"
}

variable "role_arn" {
    description = "AWS IAM Role ARN"
}

variable "session_name" {
    description = "AWS IAM Role Session Name"
}

##### EC2 #####
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

variable "ec2_kms_key_id" {
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

variable "ec2_vpc_security_group_ids" {
  description = "AWS Security Group ID"
}

variable "rds_vpc_security_group_ids" {
  description = "AWS Security Group ID"
}

variable "ec2_tags" {
  description = "AWS Tags"
  type = map(string)
}

variable "rds_tags" {
  description = "AWS Tags"
  type = map(string)
}

##### RDS #####
variable "identifier" {
    description = "AWS RDS Identifier"
}

variable "engine" {
    description = "AWS RDS Engine"
}

variable "engine_version" {
    description = "AWS RDS Engine Version"
}

variable "instance_class" {
    description = "AWS RDS Instance Type"
}

variable "multi_az" {
    description = "AWS Multi AZ Option"
}

variable "username"{
    description = "AWS RDS Master DB User Name"
}

variable "password" {
    description = "AWS RDS Master DB User Password"
}

variable "db_subnet_group_name" {
    description = "AWS RDS Subnet Group"
}

variable "rds_vpc_security_group_ids"{
    description = "AWS RDS Security Group"
}

variable "parameter_group_name" {
    description = "AWS RDS Parameter Group"
}

variable "option_group_name" {
    description = "AWS RDS Option Group"
}

variable "rds_kms_key_id" {
    description = "AWS RDS KMS Key"
}

variable "allocated_storage" {
    description = "AWS RDS Storage"
    default = 20
}

variable "monitoring_role_arn" {
    description = "AWS RDS Monitoring Role"
}

variable "rds_tags" {
  description = "AWS RDS Instance Tags"
  type = map(string)
}