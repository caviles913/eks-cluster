root_vpc_cidr_block  = "10.0.0.0/16"
root_environment     = "dev"
root_aws_region      = "us-east-1"
root_aws_zone1       = "us-east-1a"
root_aws_zone2       = "us-east-1b"
root_aws_eks_name    = "dev-cluster"
root_aws_eks_version = "1.33"


root_aws_node_group_name      = "dev-node-group"
root_aws_node_group_role_name = "dev-node-group-role"
root_ec2_instance_types       = ["t3.medium", "t2.medium"]

root_db_instance_class      = "db.t3.micro"
root_allocated_storage      = "20"
root_db_instance_identifier = "reviews-app-db-dev"
root_db_name                = "reviewsdb"
root_db_username            = "admin"
root_db_security_group_name = "reviews-app-db-sg"