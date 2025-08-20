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
  description   = "VPC CIDR Block"
  type          = string
  default       = "10.0.0.0/16"
}

variable "eks_version" {
  description   = "EKS Version"
  type          = string
  default       = "1.31"
}
variable "instance_types" {
  description = "value"
  type        = map()
  default     = ["t3.micro"]
}