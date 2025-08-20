resource "aws_vpc" "vpc" {
    cidr_block                    = var.vpc_cidr
    instance_tenancy              = "default"
    tags                          = {
        Name = "${var.project_name}-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id                        = aws_vpc.vpc.id
    tags                          = {
        Name = "${var.project_name}-igw"
    }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
    count                         = 2
    vpc_id                        = aws_vpc.vpc.id
    cidr_block                    = cidrsubnet("10.0.0.0/16", 8, count.index) //divide em duas redes /24 iniciando em 10.0.0.0/24
    availability_zone             = data.aws_availability_zones.available.names[count.index]

    tags = {
        Name                        = "${var.project_name}-public-${count.index}"
        "kubernetes.io/role/elb"    = "1" //indica que a subnet é pública e pode ser usada pelos LBs
    }
}

resource "aws_subnet" "private" {
    count                         = 2
    vpc_id                        = aws_vpc.vpc.id
    cidr_block                    = cidrsubnet("10.0.0.0/16", 8, count.index + 10) //divide em duas redes /24 mas iniciando em 10.0.10.0/24
    availability_zone             = data.aws_availability_zones.available.names[count.index]

    tags = {
        Name                        = "${var.project_name}-private-${count.index}"
        "kubernetes.io/role/internal-elb" = "1"
    }
}

