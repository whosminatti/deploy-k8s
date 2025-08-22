data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

# vpc
module "vpc" {
  source = "./modules/vpc"
  project_name          = var.project_name
  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones    = data.aws_availability_zones.available.names
  public_subnets        = var.public_subnets
  private_subnets       = var.private_subnets
}

# EKS Module
module "eks" {
  source = "./modules/eks"
  depends_on            = [module.vpc]
  project_name          = var.project_name
  environment           = var.environment
  cluster_version       = var.cluster_version
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  public_subnet_ids     = module.vpc.public_subnet_ids
  node_groups           = var.node_groups
}
