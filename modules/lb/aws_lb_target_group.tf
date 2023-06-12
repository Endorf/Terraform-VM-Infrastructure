resource "aws_lb_target_group" "instances" {

  depends_on = [aws_lb.public]

  name   = "${var.app_name}-${var.environment}-tg"
  vpc_id = var.vpc_id

  port     = 8080
  protocol = "HTTP"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.app_name
  }
}