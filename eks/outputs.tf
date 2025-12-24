



output "eks_cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "eks_cluster_version" {
  value = aws_eks_cluster.cluster.version
}