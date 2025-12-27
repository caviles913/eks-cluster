variable "root_vpc_cidr_block" {
  type = string
}

variable "root_environment" {
  type = string
}

variable "root_aws_region" {
  type = string
}
variable "root_aws_zone1" {
  type = string
}
variable "root_aws_zone2" {
  type = string
}
variable "root_aws_eks_name" {
  type = string
}

variable "root_aws_eks_version" {
  type = string
}

variable "root_aws_node_group_name" {
  type = string
}

variable "root_aws_node_group_role_name" {
  type = string
}
variable "root_ec2_instance_types" {
  type = list(string)
}