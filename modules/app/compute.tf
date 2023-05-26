resource "aws_instance" "instance_A" {
  ami                     = var.ami
  instance_type           = var.instance_type
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
  }
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World from instance_A" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_B" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World from instance_B" > index.html
              python3 -m http.server 8080 &
              EOF
}