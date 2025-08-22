variable "aws_region" {
  description   = "AWS Region"
  type          = string
  default       = "us-east-1"
}

variable "project_name" {
  description   = "value"
  type          = string  
  default       = "teste-ilia"
}

variable "environment" {
  description = "Ambiente"
  type        = string
}

variable "vpc_cidr" {
  description   = "CIDR block para VPC"
  type          = string
  default       = "10.0.0.0/16"
}
variable "public_subnets" {
  description = "CIDRs para subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "CIDRs para subnets privadas"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "cluster_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "1.31"
}

variable "node_groups" {
  description = "Configuração dos node groups"
  type = map(object({
    instance_types = list(string)
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
    disk_size = number
  }))
  default = {
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
}
