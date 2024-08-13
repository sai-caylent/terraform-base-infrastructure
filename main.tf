data "aws_availability_zones" "available" {}

locals {
  name   = "halon-entertainment-${terraform.workspace}"
  region = var.region

  vpc_cidr = var.cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

}

################################################################################
# VPC Module
################################################################################

module "networking" {
  # checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "terraform-aws-modules/vpc/aws"
  version = "v5.12.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 4)]

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

}

