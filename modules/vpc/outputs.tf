output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.this.id
}

output "igw_id" {
  description = "ID do Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "public_subnet_ids" {
  description = "IDs das subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs das subnets privadas"
  value       = aws_subnet.private[*].id
}

output "public_route_table_id" {
  description = "ID da tabela de rotas pública"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "IDs das tabelas de rotas privadas"
  value       = aws_route_table.private[*].id
}