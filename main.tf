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
  cluster_version       = var.eks_kubernetes_version
  subnet_ids            = module.vpc.private_subnet_ids
  desired_size          = var.eks_desired_size
  instance_type         = var.eks_instance_type
  min_size              = var.eks_min_size
  max_size              = var.eks_max_size
  disk_size             = var.eks_disk_size

}