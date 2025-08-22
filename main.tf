module "vpc" {
  source  = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  enable_dns_hostnames  = true
  enable_dns_support    = true
  azs                   = var.azs
  public_subnets        = var.public_subnets
  private_subnets       = var.private_subnets
}

module "eks" {
  source = "./modules/eks"
  project_name          = var.project_name
  instance_type         = var.eks_instance_type
}