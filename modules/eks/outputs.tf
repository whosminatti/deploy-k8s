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

output "kubeconfig" {
  description = "Kubeconfig"
  value       = <<EOT
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${aws_eks_cluster.this.certificate_authority[0].data}
    server: ${aws_eks_cluster.this.endpoint}
  name: ${aws_eks_cluster.this.arn}
contexts:
- context:
    cluster: ${aws_eks_cluster.this.arn}
    user: ${aws_eks_cluster.this.arn}
  name: ${aws_eks_cluster.this.arn}
current-context: ${aws_eks_cluster.this.arn}
kind: Config
users:
- name: ${aws_eks_cluster.this.arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - "eks"
        - "get-token"
        - "--cluster-name"
        - "${aws_eks_cluster.this.name}"
        - "--region"
        - "us-east-1"
EOT
  sensitive = true
}