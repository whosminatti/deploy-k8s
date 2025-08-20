resource "aws_eks_cluster" "teste" {
    depends_on            = [aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy]
    name                  = "${var.project_name}-eks"
    role_arn              = aws_iam_role.eks_cluster.arn

    vpc_config {
        subnet_ids = var.subnet_ids
    }
    version = var.eks_version
}

//IAM role pro EKS
resource "aws_iam_role" "eks_cluster" {
    name          = "${var.project_name}-eks-cluster-role"

    assume_role_policy = jsonencode({
        Version     = "2012-10-17"
        Statement   = [{
            Effect    = "Allow"
            Principal = { Service = "eks.amazonaws.com" }
            Action    = "sts:AssumeRole"
        }]
    })
}
//Associa role ao EKS
resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
    policy_arn        = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role              = aws_iam_role.eks_cluster.name
}

resource "aws_eks_node_group" "default" {
    depends_on = [
        aws_iam_role_policy_attachment.eks_nodes_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.eks_nodes_AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.eks_nodes_AmazonEKS_CNI_Policy
    ]
    cluster_name    = aws_eks_cluster.teste.name
    node_group_name = "${var.project_name}-node-group"
    node_role_arn   = aws_iam_role.eks_nodes.arn
    subnet_ids      = var.subnet_ids

    scaling_config {
        desired_size = 1
        max_size     = 2
        min_size     = 1
    }

    instance_types = var.instance_types
  
}

resource "aws_iam_role" "eks_nodes" {
    name = "${var.project_name}-eks-nodes-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect    = "Allow"
            Principal = { Service = "ec2.amazonaws.com" }
            Action    = "sts:AssumeRole"
        }]
    })
}

resource "aws_iam_role_policy_attachment" "eks_nodes_AmazonEKSWorkerNodePolicy" {
    role       = aws_iam_role.eks_nodes.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_nodes_AmazonEC2ContainerRegistryReadOnly" {
    role       = aws_iam_role.eks_nodes.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks_nodes_AmazonEKS_CNI_Policy" {
    role       = aws_iam_role.eks_nodes.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}