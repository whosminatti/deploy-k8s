resource "aws_security_group" "eks_nodes" {
    name        = "${var.project_name}-eks-nodes-sg"
    description = "Security group for EKS worker nodes"
    vpc_id      = var.vpc_id

    ingress {
        description = "Allow worker nodes to communicate with each other"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        self        = true
    }

    ingress {
        description = "Allow inbound traffic from LoadBalancer"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.project_name}-eks-nodes-sg"
    }
}
