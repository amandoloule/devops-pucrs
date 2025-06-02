# ec2.tf - Configuração da instância EC2
resource "aws_instance" "app_server" {
  ami           = "ami-08c40ec9ead489470" # AMI do Ubuntu 22.04 LTS na região us-east-1
  instance_type = var.instance_type       # Tipo de instância definido por variável
  
  # Associa o security group à instância
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  
  # Tags para organização e identificação
  tags = {
    Name = "devops-pucrs-app", # Nome da instância
    Project = "devops-pucrs"   # Projeto associado
  }

  # Força recriação da instância se o user_data mudar
  user_data_replace_on_change = true

  # Script de inicialização que será executado na instância
  user_data = <<-EOF
              #!/bin/bash
              docker stop $(docker ps -q) || true
              docker pull ${var.docker_image}
              docker run -d -p 3000:3000 ${var.docker_image}
              EOF
}
