resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 LTS
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  
  # Adicione esta tag para identificação única
  tags = {
    Name = "devops-pucrs-app",
    Project = "devops-pucrs"
  }

  # Força a substituição apenas quando a imagem Docker mudar
  user_data_replace_on_change = true
  user_data = <<-EOF
              #!/bin/bash
              docker stop $(docker ps -q) || true
              docker pull ${var.docker_image}
              docker run -d -p 3000:3000 ${var.docker_image}
              EOF
}
