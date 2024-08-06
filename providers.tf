provider "aws" {
  region = local.region

  default_tags {
    tags = {
      configuration = "terraform-base-infrastructure"
      terraform     = "true"
      workspace     = terraform.workspace
      map-migrated  = var.map_migrated_tag
      environment   = "Staging"
      owner         = "NEP"
      project       = "NEP"
    }
  }
}
