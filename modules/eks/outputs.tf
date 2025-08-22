output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.main.name
}
output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = aws_eks_cluster.main.endpoint
}
output "cluster_version" {
  description = "Versão do cluster"
  value       = aws_eks_cluster.main.version
}
output "cluster_arn" {
  description = "ARN do cluster"
  value       = aws_eks_cluster.main.arn
}
output "cluster_security_group_id" {
  description = "Security Group do cluster"
  value       = aws_security_group.cluster.id
}
output "node_groups" {
  description = "Node groups criados"
  value       = aws_eks_node_group.main
}
output "cluster_certificate_authority_data" {
  description = "Certificado do cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}