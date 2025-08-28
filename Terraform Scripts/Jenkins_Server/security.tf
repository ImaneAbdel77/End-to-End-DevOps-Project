resource "aws_security_group" "web-traffic" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["98.83.232.140/32"] # ⚠️ Remplace par ton IP publique
  }

  ingress {
    description = "Jenkins Web UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ouvert au monde si tu veux y accéder de partout
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "jenkins-sg"
  }
}
