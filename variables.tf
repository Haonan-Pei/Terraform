variable "region" {
  description = "AWS Region"
}

variable "role_arn" {
    description = "AWS IAM Role ARN"
}

variable "session_name" {
    description = "AWS IAM Role Session Name"
}
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

variable "availability_zone" {
    description = "AWS RDS Availability Zone"
}

variable "multi_az" {
    description = "AWS Multi AZ Option"
    default = "false"
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

variable "vpc_security_group_ids"{
    description = "AWS RDS Security Group"
}

variable "parameter_group_name" {
    description = "AWS RDS Parameter Group"
}

variable "option_group_name" {
    description = "AWS RDS Option Group"
}

variable "kms_key_id" {
    description = "AWS RDS KMS Key"
}

variable "allocated_storage" {
    description = "AWS RDS Storage"
    default = 20
}

variable "monitoring_role_arn" {
    description = "AWS RDS Monitoring Role"
}

variable "tags" {
  description = "AWS RDS Instance Tags"
  type = map(string)
}