provider "aws" {
  region = local.region

  default_tags {
    tags = {
      Account       = var.account_id
      Configuration = "terraform-base-infrastructure"
      Terraform     = "true"
      Workspace     = terraform.workspace
      map-migrated  = var.map_migrated_tag
      Environment   = "Staging"
      Owner         = "NEP"
      Project       = "NEP"
    }
  }
}
