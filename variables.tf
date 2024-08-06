variable "region" {
  type        = string
  description = "The region where the resources will be deployed."
  default     = "us-west-2"
}

variable "account_id" {
  type        = string
  description = "The AWS account ID where this resources will be deployed."
}

variable "account_name" {
  type        = string
  description = "The name or alias of the account where the resources will be deployed."
}

variable "map_migrated_tag" {
  type        = string
  description = "The value of the MAP migrated tag used in all the resources (at provider level)."
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region."
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC."
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "database_subnets" {
  type        = list(string)
  description = "A list of database subnets."
  default     = []
}

variable "intra_subnets" {
  type        = list(string)
  description = "A list of intra subnets."
  default     = []
}

variable "private_inbound_acl_rules" {
  type        = list(map(string))
  description = "Private subnets inbound network ACLs"
  default     = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
}

variable "public_inbound_acl_rules" {
  type        = list(map(string))
  description = "Public subnets inbound network ACLs"
  default     = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
}

variable "database_inbound_acl_rules" {
  type        = list(map(string))
  description = "Database subnets inbound network ACLs"
  default     = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
}

variable "intra_inbound_acl_rules" {
  type        = list(map(string))
  description = "Intra subnets inbound network ACLs"
  default     = [{ "cidr_block" : "0.0.0.0/0", "from_port" : 0, "protocol" : "-1", "rule_action" : "allow", "rule_number" : 100, "to_port" : 0 }]
}

variable "create_database_subnet_group" {
  type    = bool
  default = true

}

variable "create_database_subnet_route_table" {
  description = "Controls if separate route table for database should be created"
  type        = bool
  default     = true
}

variable "create_database_internet_gateway_route" {
  description = "Controls if an internet gateway route for public database access should be created"
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
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

variable "private_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for private subnets"
  default     = true
}

variable "public_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for public subnets"
  default     = true
}

variable "intra_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for intra subnets"
  default     = true
}

variable "database_dedicated_network_acl" {
  type        = bool
  description = "Whether to use dedicated network ACL (not default) and custom rules for database subnets"
  default     = true
}

variable "create_vpc_peering_connection" {
  type        = bool
  description = "If 'true' a VPC peering connection will be created."
  default     = true
}

variable "requester_allow_remote_vpc_dns_resolution" {
  type        = bool
  description = "Allow requester VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the accepter VPC"
  default     = true
}

variable "accepter_aws_assume_role_arn" {
  type        = string
  description = "Accepter AWS Assume Role ARN"
  default     = null
}

variable "accepter_region" {
  type        = string
  description = "Accepter AWS region"
}

variable "accepter_vpc_id" {
  type        = string
  description = "The ID of the VPC belonging to the accepter."
}

variable "accepter_allow_remote_vpc_dns_resolution" {
  type        = bool
  description = "Allow accepter VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the accepter VPC"
  default     = true
}

variable "tags" {
  type        = map(any)
  description = "The tags map to associate to the resources."
  default     = {}
}
