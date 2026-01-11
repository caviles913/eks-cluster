locals {
  # Convert list(object) -> map so we can use for_each
  access_principals_map = {
    for p in var.access_principals :
    p.principal_arn => p
  }
}

resource "aws_eks_access_entry" "principal" {
  for_each = local.access_principals_map

  cluster_name  = local.eks_cluster_name
  principal_arn = each.value.principal_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "principal" {
  for_each = local.access_principals_map

  cluster_name  = local.eks_cluster_name
  principal_arn = aws_eks_access_entry.principal[each.key].principal_arn
  policy_arn    = each.value.policy_arn

  access_scope {
    type       = length(try(each.value.namespaces, [])) > 0 ? "namespace" : "cluster"
    namespaces = length(try(each.value.namespaces, [])) > 0 ? each.value.namespaces : null
  }
}
