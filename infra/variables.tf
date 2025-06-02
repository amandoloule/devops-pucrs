# variables.tf - Definição de variáveis para o projeto
variable "aws_region" {
  default = "us-east-1" # Região AWS padrão
}

variable "instance_type" {
  default = "t2.micro" # Tipo de instância EC2 padrão (camada gratuita elegível)
}

variable "docker_image" {
  default = "ghcr.io/amandoloule/devops-pucrs:latest" # Imagem Docker a ser executada
}
