resource "aws_iam_role" "worker_ec2" {
  name               = "${var.prefix}-worker-ec2-${var.environment_name}"
  assume_role_policy = var.ec2_role_policy
}

resource "aws_iam_policy" "worker_ec2" {
  name        = "${ var.prefix }-worker-ec2"
  policy = var.ec2_iam_policy
}