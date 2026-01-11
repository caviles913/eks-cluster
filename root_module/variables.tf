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

# variable "root_iam_user_name" {
#   type = string
# }

variable "root_eks_access_principals" {
  type = list(object({
    principal_arn = string
    policy_arn    = string
    namespaces    = optional(list(string), [])
  }))
}
variable "root_access_level" {
  type = string
}

variable "root_namespaces" {
  type = list(string)
}

#############################
variable "root_db_instance_class" {
  type = string
}

variable "root_db_instance_identifier" {
  type = string
}

variable "root_db_name" {
  type = string
}

variable "root_db_username" {
  type = string
}

variable "root_allocated_storage" {
  type = string
}

variable "root_db_security_group_name" {
  type = string
}