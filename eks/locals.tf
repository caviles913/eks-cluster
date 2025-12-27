locals {
  eks_cluster_name    = var.aws_cluster_name
  eks_cluster_version = var.aws_cluster_version
  worker_node_group_name = var.aws_node_group_name
  node_group_role = var.aws_node_group_role_name
}