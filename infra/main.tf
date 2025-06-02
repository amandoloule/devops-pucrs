# main.tf - Configuração principal do Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Provedor oficial da AWS
      version = "~> 5.0"        # Versão 5.x do provider AWS
    }
  }
}

# Configuração do provedor AWS
provider "aws" {
  region = var.aws_region # Região AWS definida pela variável
}
