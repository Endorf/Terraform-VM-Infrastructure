resource "aws_instance" "instance_A" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = aws_subnet.private_subnet1.id
  security_groups = [aws_security_group.sg.id]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World from instance_A" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_B" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.sg.id]
  subnet_id = aws_subnet.private_subnet2.id
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World from instance_B" > index.html
              python3 -m http.server 8080 &
              EOF
}