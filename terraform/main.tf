provider "aws" {
  region = var.aws_region
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP & SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key Pair from GitHub secret
resource "aws_key_pair" "main_key" {
  key_name   = var.key_name
  public_key = var.public_key
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-00d8fc944fb171e29"  # Ubuntu 22.04 ap-southeast-1
  instance_type = var.instance_type
  key_name      = aws_key_pair.main_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "devops-web-server"
  }
}

# Output Public IP
output "public_ip" {
  value = aws_instance.web_server.public_ip
}
