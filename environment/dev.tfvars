aws_region      = "us-east-1"
project_name    = "teste-ilia"
environment     = "dev"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
cluster_version = "1.31"
node_groups     = {
  general = {
    instance_types = ["t3.micro"]
    scaling_config = {
      desired_size = 2
      max_size     = 2
      min_size     = 1
    }
    disk_size = 20
  }
}
