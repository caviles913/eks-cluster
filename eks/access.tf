variable "access_principals" {
  description = "EKS access principals to grant access (role/user ARNs)."
  type = list(object({
    principal_arn = string
    policy_arn    = string
    namespaces    = optional(list(string), [])
  }))
}


resource "aws_eks_access_entry" "principal" {
  for_each = var.access_principals
  cluster_name  = local.eks_cluster_name
  principal_arn = each.value.principal_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "principal" {
  cluster_name  = local.eks_cluster_name
  principal_arn = each.value.principal_arn
  policy_arn    = each.value.policy_arn

  access_scope {
    type       = length(each.value.namespaces) > 0 ? "namespace" : "cluster"
    namespaces = length(each.value.namespaces) > 0 ? each.value.namespaces : null
  }

  depends_on = [aws_eks_access_entry.principal[each.key]]
}