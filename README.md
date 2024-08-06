# Terraform-base-infrastructure

## Purpose
Terraform repository to create VPC, Security Group, Endpoint and ALB resources on AWS.

<!-- BEGIN_TF_DOCS -->
# Examples

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.61.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The AWS account ID where this resources will be deployed. | `string` | n/a | yes |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The CIDR block for the VPC. | `string` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `false` | no |
| <a name="input_map_migrated_tag"></a> [map\_migrated\_tag](#input\_map\_migrated\_tag) | The value of the MAP migrated tag used in all the resources (at provider level). | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources will be deployed. | `string` | `"us-west-2"` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `false` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accepter_accept_status"></a> [accepter\_accept\_status](#output\_accepter\_accept\_status) | Accepter VPC peering connection request status |
| <a name="output_accepter_connection_id"></a> [accepter\_connection\_id](#output\_accepter\_connection\_id) | Accepter VPC peering connection ID |
| <a name="output_database_subnet_arns"></a> [database\_subnet\_arns](#output\_database\_subnet\_arns) | List of ARNs of database subnets |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | List of IDs of database subnets |
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | Array containing the full resource object and attributes for all endpoints created |
| <a name="output_intra_subnet_arns"></a> [intra\_subnet\_arns](#output\_intra\_subnet\_arns) | List of ARNs of intra subnets |
| <a name="output_intra_subnets"></a> [intra\_subnets](#output\_intra\_subnets) | List of IDs of intra subnets |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | List of ARNs of public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_requester_accept_status"></a> [requester\_accept\_status](#output\_requester\_accept\_status) | Requester VPC peering connection request status |
| <a name="output_requester_connection_id"></a> [requester\_connection\_id](#output\_requester\_connection\_id) | Requester VPC peering connection ID |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
## Resources

- data source.aws_availability_zones.available (main.tf#1)
<!-- END_TF_DOCS -->
