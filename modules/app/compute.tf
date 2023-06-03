resource "aws_instance" "instance_A" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = module.vpc.subnets_A.private.id
  security_groups = [module.vpc.instance_security_group_id]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World from instance_A" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_B" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id = module.vpc.subnets_B.private.id
  security_groups = [module.vpc.instance_security_group_id]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World from instance_B" > index.html
              python3 -m http.server 8080 &
              EOF
}