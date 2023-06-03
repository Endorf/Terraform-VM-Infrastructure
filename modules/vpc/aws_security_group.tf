

resource "aws_security_group" "alb" {
  name                = "${ var.app_name }-${ var.environment_name }-alb-security-group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_name
  }
}


resource "aws_security_group" "instance" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.private_subnet1,
    aws_subnet.private_subnet2
  ]

  name                = "${ var.app_name }-${ var.environment_name }-instance-security-group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = "8080"
    to_port     = "8080"
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