resource "aws_launch_configuration" "worker" {
  name_prefix          = "${var.prefix}-worker"
  image_id             = var.ami
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.worker_ec2.name
  security_groups      = [var.security_group_id]

  user_data = file("${path.module}/aws_launch_configuration_userdata/worker.sh")

  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}