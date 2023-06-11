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

module "ec2" {
  source = "../ec2"

  app_name         = var.app_name
  environment_name = var.environment_name
  prefix = var.app_name
  desired_capacity = 1
  max_size = 2
  min_size = 1
  subnet_ids = [module.vpc.subnets_A.public.id, module.vpc.subnets_B.public.id]
  security_group_id = module.vpc.instance_security_group_id
  instance_type = var.instance_type
  ami = var.ami
  alb_target_group_arn = module.lb.lb_target_group_arn
  ec2_role_policy = file("${path.module}/aws_iam_policies/ec2_role_policy.json")
  ec2_iam_policy = file("${path.module}/aws_iam_policies/ec2_iam_policy.json")
}