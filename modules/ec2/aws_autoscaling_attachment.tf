resource "aws_autoscaling_attachment" "worker" {
  autoscaling_group_name = aws_autoscaling_group.worker.id
  lb_target_group_arn    = var.alb_target_group_arn
}
