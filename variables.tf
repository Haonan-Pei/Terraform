
variable "instance_type" {
  description = "AWS EC2 Instance Type"
}

variable "root_volume_type" {
  description = "AWS EC2 Root Volume Type"
  default = "gp3"
}

variable "root_volume_size" {
  description = "AWS EC2 Root Volume Size"
}

variable "ebs_volume_type" {
  description = "AWS EC2 Data Volume Type"
  default = "gp3"
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