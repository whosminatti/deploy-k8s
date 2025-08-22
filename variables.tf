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
variable "vpc_cidr" {
  description   = "CIDR block para VPC"
  type          = string
  default       = "10.0.0.0/16"
}
variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
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
variable "eks_kubernetes_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "1.31"
}
variable "eks_desired_size" {
  description = "Número desejado de nodes"
  type        = number
  default     = 1
}
variable "eks_instance_type" {
  description = "Tipo de instância para os nodes"
  type        = string
  default     = "t3.micro"
}
variable "eks_min_size" {
  description = "Número mínimo de nodes"
  type        = number
  default     = 1
}
variable "eks_max_size" {
  description = "Número máximo de nodes"
  type        = number
  default     = 2
}
variable "eks_disk_size" {
  description = "Tamanho do disco dos nodes (GB)"
  type        = number
  default     = 20
}

