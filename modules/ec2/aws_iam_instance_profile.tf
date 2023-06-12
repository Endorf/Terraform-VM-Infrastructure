resource "aws_iam_instance_profile" "worker_ec2" {
  name = "${var.prefix}-worker-ec2"
  role = aws_iam_role.worker_ec2.name
}