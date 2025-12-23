locals {
  cidr_block  = var.vpc_cidr_block
  env         = var.environment
  region      = var.aws_region
  zone1       = var.aws_zone1
  zone2       = var.aws_zone2
  eks_name    = var.aws_eks_name
  eks_version = var.aws_eks_version
}