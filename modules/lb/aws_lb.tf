resource "aws_lb" "public" {
  name               = "${var.app_name}-${var.environment}-lb"
  load_balancer_type = "application"
  internal           = true
  subnets            = var.public_subnet_ids
  security_groups    = [var.public_security_group_id]

  tags = {
    Name = var.app_name
  }

  drop_invalid_header_fields = true
}