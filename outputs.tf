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
