# Tell Terraform we're using AWS
provider "aws" {
  region = "us-east-1"
}

# Create a security group (firewall rules)
resource "aws_security_group" "jay_sg" {
  name        = "jay-cloud-sg"
  description = "Allow web and SSH traffic"

  # Allow anyone to visit our website on port 5000
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH so we can connect to the server
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 server (free tier)
resource "aws_instance" "jay_server" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.jay_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              docker run -d -p 5000:5000 jaycloudlabs/jay-cloud-app:latest
              EOF

  tags = {
    Name = "Jay-Cloud-Portfolio"
  }
}

output "server_ip" {
  value = aws_instance.jay_server.public_ip
}