

module "main_vpc" {
  source          = "../vpc_module"
  vpc_cidr_block  = var.root_vpc_cidr_block
  environment     = var.root_environment
  aws_region      = var.root_aws_region
  aws_zone1       = var.root_aws_zone1
  aws_zone2       = var.root_aws_zone2
  aws_eks_name    = var.root_aws_eks_name
  aws_eks_version = var.root_aws_eks_version

}


module "eks_cluster" {
  source                   = "../eks"
  aws_cluster_name         = var.root_aws_eks_name
  aws_cluster_version      = var.root_aws_eks_version
  subnet_ids               = module.main_vpc.public_subnet_ids
  aws_node_group_name      = var.root_aws_node_group_name
  aws_node_group_role_name = var.root_aws_node_group_role_name
  ec2_types                = var.root_ec2_instance_types
}

module "rds_instance" {
  source                 = "../rds"
  subnet_ids             = module.main_vpc.private_subnet_ids
  db_security_group_name = var.root_db_security_group_name
  db_identifier          = var.root_db_instance_identifier
  instance_class         = var.root_db_instance_class
  allocated_storage      = var.root_allocated_storage
  db_name                = var.root_db_name
  db_username            = var.root_db_username
  allowed_cidr           = module.main_vpc.vpc_cidr_block
}