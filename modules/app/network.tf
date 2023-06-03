module "vpc" {
  source = "../vpc"

  app_name         = var.app_name
  environment_name = var.environment_name
  cidr_block = "10.0.0.0/16"
}

module "lb" {
  source = "../lb"

  app_name         = var.app_name
  environment_name = var.environment_name
  vpc_id = module.vpc.vpc_id
  public_security_group_id = module.vpc.alb_security_group_id
  public_subnet_ids = [module.vpc.subnets_A.public.id, module.vpc.subnets_B.public.id]
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
