resource "aws_security_group" "web-traffic" {
  name        = "ansible-sg"
  description = "Allow SSH and Ansible traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["34.229.214.25/32"] # ⚠️ Remplace par ton IP publique
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "ansible-sg"
  }
}
