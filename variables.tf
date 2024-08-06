variable "region" {
  type        = string
  description = "The region where the resources will be deployed."
  default     = "us-west-2"
}

variable "account_id" {
  type        = string
  description = "The AWS account ID where this resources will be deployed."
}

variable "map_migrated_tag" {
  type        = string
  description = "The value of the MAP migrated tag used in all the resources (at provider level)."
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "single_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}
