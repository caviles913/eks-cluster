



output "eks_cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "eks_cluster_version" {
  value = aws_eks_cluster.cluster.version
}

output "principal_arn" {
  value = data.aws_iam_user.this.arn
}

# output "policy_arn" {
#   value = local.policy_arn
# }
