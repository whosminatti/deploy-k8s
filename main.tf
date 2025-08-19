module "vpc" {
    source          = "./module/vpc"
    project_name    = var.project_name
    vpc_cidr        = ""
}

module "sg" {
    source          = "./module/security_group"
    project_name    = var.project_name
    vpc_id          = module.vpc.vpc_id
}

module "eks" {
    source          = "./module/eks"
    project_name    = var.project_name
    subnet_ids      = module.vpc.public_subnets_id //subnet publica por conta do igw
    eks_version     = var.eks_version
}