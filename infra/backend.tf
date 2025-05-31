terraform {
  backend "s3" {
    bucket         = "devops-pucrs-tfstate" # Crie manualmente na AWS
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
