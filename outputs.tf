output "vpc_id" {
  description = "ID da VPC"
  value       = module.networking.vpc_id
}
output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = module.eks.cluster_name
}
output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}
output "cluster_security_group_id" {
  description = "Security Group do cluster"
  value       = module.eks.cluster_security_group_id
}