variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "docker_image" {
  default = "ghcr.io/amandoloule/devops-pucrs:latest"
}
