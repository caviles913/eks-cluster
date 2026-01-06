locals {
  eks_cluster_name       = var.aws_cluster_name
  eks_cluster_version    = var.aws_cluster_version
  worker_node_group_name = var.aws_node_group_name
  node_group_role        = var.aws_node_group_role_name
  policy_arn_by_level = {
    "cluster-admin" = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
    "admin"         = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
    "view"          = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
  }
  policy_arn = local.policy_arn_by_level[var.access_level]
}