output "vpc_id" {
  description = "ID da VPC"
  value       = module.vpc.vpc_id
}
output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}
