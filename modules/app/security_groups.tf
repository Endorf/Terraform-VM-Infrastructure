

resource "aws_security_group" "alb" {
  name                = "${ var.app_name }-${ var.environment_name }-alb-security-group"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_security_group_rule" "allow_http_inbound_alb" {
  type                = "ingress"
  security_group_id   = aws_security_group.alb.id

  from_port           = 80
  to_port             = 80
  protocol            = "tcp"
  cidr_blocks         = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_http_outbound_alb" {
  type                = "egress"
  security_group_id   = aws_security_group.alb.id

  from_port           = 0
  to_port             = 0
  protocol            = "-1"
  cidr_blocks         = ["0.0.0.0/0"]
}














resource "aws_security_group" "sg" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.private_subnet1,
    aws_subnet.private_subnet2
  ]

  name                = "${ var.app_name }-${ var.environment_name }-instance-security-group"
  vpc_id = aws_vpc.vpc.id
}


resource "aws_security_group_rule" "allow_http_inbound" {
  type                = "ingress"
  security_group_id   = aws_security_group.sg.id

  from_port           = 8080
  to_port             = 8080
  protocol            = "tcp"
  cidr_blocks         = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_http_outbound" {
  type                = "egress"
  security_group_id   = aws_security_group.sg.id

  from_port           = 0
  to_port             = 0
  protocol            = "-1"
  cidr_blocks         = ["0.0.0.0/0"]
}