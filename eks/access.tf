data "aws_iam_user" "this" {
  user_name = var.iam_user_name
}

resource "aws_eks_access_entry" "user" {
  cluster_name  = local.eks_cluster_name
  principal_arn = data.aws_iam_user.this.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "user" {
  cluster_name  = local.eks_cluster_name
  principal_arn = data.aws_iam_user.this.arn
  policy_arn    = local.policy_arn

  access_scope {
    type       = length(var.namespaces) > 0 ? "namespace" : "cluster"
    namespaces = length(var.namespaces) > 0 ? var.namespaces : null
  }

  depends_on = [aws_eks_access_entry.user]
}