variable "instance_type" {}

resource "aws_instance" "default" {
  ami                = "ami-0c3fd0f5d33134a76"
  vpc_security_group = [aws_security_group.default.id]
  instance_type      = var.instance_type

  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF
}

resource "aws_security_group" "default" {
  name = "ec2"

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }

  engress {
    from_port  = 80
    to_port    = 80
    protocol   = "-1"
    cidr_block = ["0.0.0.0/0"]
  }
}

output "public_dns" {
  value = aws_instance.default.public_dns
}
