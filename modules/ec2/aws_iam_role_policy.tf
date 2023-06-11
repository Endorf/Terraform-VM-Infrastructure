resource "aws_iam_role" "worker_ec2" {
  name               = "${var.prefix}-worker-ec2-${var.environment_name}"
  assume_role_policy = file("${path.module}/aws_iam_policies/ec2_role_policy.json")
}

resource "aws_iam_policy" "worker_ec2" {
  name        = "${ var.prefix }-worker-ec2"
  policy = file("${path.module}/aws_iam_policies/iam_ec2_policy.json")
}