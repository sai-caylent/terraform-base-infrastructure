output "vpc_id" {
  value       = module.networking.vpc_id
  description = "The ID of the VPC"
}

output "vpc_arn" {
  value       = module.networking.vpc_arn
  description = "The ARN of the VPC"
}

output "vpc_cidr_block" {
  value       = module.networking.vpc_cidr_block
  description = "The CIDR block of the VPC"
}

output "private_subnets" {
  value       = module.networking.private_subnets
  description = "List of IDs of private subnets"
}

output "private_subnet_arns" {
  value       = module.networking.private_subnet_arns
  description = "List of ARNs of private subnets"
}

output "public_subnets" {
  value       = module.networking.public_subnets
  description = "List of IDs of public subnets"
}

output "public_subnet_arns" {
  value       = module.networking.public_subnet_arns
  description = "List of ARNs of public subnets"
}

output "database_subnets" {
  value       = module.networking.database_subnets
  description = "List of IDs of database subnets"
}

output "database_subnet_arns" {
  value       = module.networking.database_subnet_arns
  description = "List of ARNs of database subnets"
}

output "intra_subnets" {
  value       = module.networking.intra_subnets
  description = "List of IDs of intra subnets"
}

output "intra_subnet_arns" {
  value       = module.networking.intra_subnet_arns
  description = "List of ARNs of intra subnets"
}

output "endpoints" {
  value       = module.networking.endpoints
  description = "Array containing the full resource object and attributes for all endpoints created"
}

output "requester_connection_id" {
  value       = join("", module.vpc_peering_cross_account[*].requester_connection_id)
  description = "Requester VPC peering connection ID"
}

output "requester_accept_status" {
  value       = join("", module.vpc_peering_cross_account[*].requester_accept_status)
  description = "Requester VPC peering connection request status"
}

output "accepter_connection_id" {
  value       = join("", module.vpc_peering_cross_account[*].accepter_connection_id)
  description = "Accepter VPC peering connection ID"
}

output "accepter_accept_status" {
  value       = join("", module.vpc_peering_cross_account[*].accepter_accept_status)
  description = "Accepter VPC peering connection request status"
}
