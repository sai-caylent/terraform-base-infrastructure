account_id       = "258937327563"
account_name     = "prod"
azs              = ["us-west-1a", "us-west-1b", "us-west-1c"]
cidr             = "172.21.0.0/18"
public_subnets   = ["172.21.0.0/24", "172.21.1.0/24", "172.21.2.0/24"]
private_subnets  = ["172.21.4.0/24", "172.21.8.0/24", "172.21.12.0/24"]
database_subnets = ["172.21.20.0/24", "172.21.21.0/24", "172.21.22.0/24"]
intra_subnets    = ["172.21.24.0/24", "172.21.25.0/24", "172.21.26.0/24"]

create_database_subnet_group           = true
create_database_subnet_route_table     = true
create_database_internet_gateway_route = false
enable_dns_hostnames                   = true
enable_dns_support                     = true
enable_nat_gateway                     = true
single_nat_gateway                     = false

tags = {
  Environment = "Production"
  Owner       = "F45"
  Project     = "F45"
}
