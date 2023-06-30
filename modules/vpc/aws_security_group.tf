

resource "aws_security_group" "alb" {
  name   = "${var.app_name}-${var.environment}-alb-security-group"
  description = "LoadBalancer Security group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "Allow inbound HTTP traffic"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-ingress-sgr:exp:2023-10-24
  }
  ingress {
    description = "Allow inbound SSH traffic"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-ingress-sgr:exp:2023-10-24
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr:exp:2023-10-24
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

  name   = "${var.app_name}-${var.environment}-instance-security-group"
  description = "EC2 instances Security group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description = "Allow inbound HTTP traffic"
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-ingress-sgr:exp:2023-10-24
  }
  ingress {
    description = "Allow inbound SSH traffic"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-ingress-sgr:exp:2023-10-24
  }


  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr:exp:2023-10-24
  }
}