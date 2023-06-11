resource "aws_autoscaling_group" "worker" {
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  vpc_zone_identifier = var.subnet_ids
  
  launch_configuration = aws_launch_configuration.worker.name
  
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = var.app_name
    propagate_at_launch = true
  }
}