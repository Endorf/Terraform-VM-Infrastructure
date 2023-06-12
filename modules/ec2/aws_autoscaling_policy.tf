resource "aws_autoscaling_policy" "worker_ec2" {
  name                   = "${var.prefix}-worker-ec2"
  scaling_adjustment     = 1
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.worker.name
}