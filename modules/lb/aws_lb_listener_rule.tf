resource "aws_lb_listener_rule" "instances" {
  listener_arn        = aws_lb_listener.http.arn
  priority            = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.instances.arn
  }
}