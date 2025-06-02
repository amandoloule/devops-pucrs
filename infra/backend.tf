# backend.tf - Configuração do backend para armazenamento do state file
terraform {
  backend "s3" {
    bucket         = "devops-pucrs-tfstate" # Bucket S3 deve ser criado manualmente antes
    key            = "terraform.tfstate"    # Nome do arquivo de estado
    region         = "us-east-1"            # Região do bucket S3
    encrypt        = true                   # Habilita criptografia do state file
  }
}
