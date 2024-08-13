terraform {
  backend "s3" {
    bucket         = "halon-terraform-backend"
    key            = "terraform-base-infrastructure.tfstate"
    region         = "us-west-2"
    dynamodb_table = "halon-terraform-state-lock"
    encrypt        = true
  }
}
