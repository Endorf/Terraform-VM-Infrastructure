resource "aws_lb" "public" {
  name               = "${var.app_name}-${var.environment}-lb"
  load_balancer_type = "application"
  internal           = false
  subnets            = var.public_subnet_ids
  security_groups    = [var.public_security_group_id]

  tags = {
    Name = var.app_name
  }
}