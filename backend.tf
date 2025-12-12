terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-jaffar"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-locks"
  }
}
