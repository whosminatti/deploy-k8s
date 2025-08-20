terraform {
  backend "s3" {
    bucket         = "teste-ilia-deploy-k8s"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}