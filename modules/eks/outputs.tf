output "cluster_id" {
  description = "ID do cluster EKS"
  value       = aws_eks_cluster.this.id
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificate authority data do cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "node_iam_role_name" {
  description = "Nome do IAM Role dos nodes"
  value       = aws_iam_role.nodes.name
}