

variable "aws_cluster_name" {
  type = string
}

variable "aws_cluster_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "aws_node_group_name" {
  type = string
}

variable "aws_node_group_role_name" {
  type = string
}

variable "ec2_types" {
  type = list()
}