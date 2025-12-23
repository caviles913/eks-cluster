provider "aws" {
  region = var.root_aws_region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.49"
    }
  }
}

backend "s3" {
  key            = "eks-cluster/terraform.tfstate"
  region         = var.root_aws_region
  dynamodb_table = "eks-terraform-lock-table"
  encrypt        = true
}