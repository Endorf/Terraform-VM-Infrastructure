resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = var.app_name
  }
}



module "lb" {
  source = "../lb"

  app_name         = var.app_name
  environment_name = var.environment_name
  vpc_id = aws_vpc.vpc.id
  public_security_group_id = aws_security_group.alb.id
  public_subnet_ids = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
}

resource "aws_lb_target_group_attachment" "instance_A" {
  target_group_arn    = module.lb.lb_target_group_arn
  target_id           = aws_instance.instance_A.id
  port                = 8080
}

resource "aws_lb_target_group_attachment" "instance_B" {
  target_group_arn    = module.lb.lb_target_group_arn
  target_id           = aws_instance.instance_B.id
  port                = 8080
}
