# security.tf - Configuração de segurança (Security Group)
resource "aws_security_group" "app_sg" {
  name        = "devops-pucrs-sg"     # Nome do security group
  description = "Allow HTTP traffic"  # Descrição do propósito

  # Regra de entrada para tráfego HTTP na porta 3000
  ingress {
    from_port   = 3000 # Porta do container Docker
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acesso de qualquer IP (em produção, restrinja isso)
  }

  # Regra de entrada para SSH (acesso remoto)
  ingress {
    from_port   = 22 # Porta SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Em produção, restrinja para IPs específicos
  }

  # Regra de saída - permite todo tráfego de saída
  egress {
    from_port   = 0 # Todas as portas
    to_port     = 0
    protocol    = "-1" # Todos os protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }
}
