terraform {
  backend "s3" {
    bucket         = "halon-entertainment-terraform-backend"
    key            = "terraform-base-infrastructure.tfstate"
    region         = "us-west-2"
    dynamodb_table = "halon-entertainment-terraform-state-lock"
    encrypt        = true
  }
}
