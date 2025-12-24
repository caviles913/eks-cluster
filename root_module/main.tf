

module "main_vpc" {
  source         = "../vpc_module"
  vpc_cidr_block = var.root_vpc_cidr_block
  environment    = var.root_environment
  aws_region     = var.root_aws_region
  aws_zone1      = var.root_aws_zone1
  aws_zone2      = var.root_aws_zone2
  aws_eks_name = module.eks_cluster.eks_cluster_name
  aws_eks_version = module.eks_cluster.eks_cluster_version

}


module "eks_cluster" {
  source              = "../eks"
  aws_cluster_name    = var.root_aws_eks_name
  aws_cluster_version = var.root_aws_eks_version
  subnet_ids          = module.main_vpc.public_subnet_ids
}