output "lb_target_group_arn" {
  value = aws_lb_target_group.instances.arn
  description = "lb_target_group_arn"
}