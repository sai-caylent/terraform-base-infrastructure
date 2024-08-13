locals {

  user_data = <<-EOT
    #!/bin/bash
    echo "Hello Terraform!"
  EOT

}

data "aws_ssm_parameter" "windows_server_ami" {
  name = "/halon/packer/windows/image"
}

################################################################################
# EC2 Module
################################################################################

module "ec2_ad_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "v5.6.1"

  name = local.name

  ami                    = data.aws_ssm_parameter.windows_server_ami.value
  subnet_id              = element(module.networking.private_subnets, 0)
  instance_type          = "t3.medium"
  key_name               = "halon-key-pair"
  vpc_security_group_ids = [module.security_group.security_group_id]
  metadata_options = {
    http_tokens = "required"
  }


  create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  user_data = file("${path.module}/user_data/configure_ad.ps1")

  enable_volume_tags = true
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
    },
  ]
  private_ip = "172.20.0.5"
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.networking.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-icmp", "rdp-tcp", "rdp-udp"]
  egress_rules        = ["all-all"]

  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "${local.vpc_cidr}"
    }
  ]

}
