resource "aws_iam_policy_attachment" "worker_ec2_attachment" {
  name       = "${var.prefix}-worker-ec2-attachment"
  roles      = ["${aws_iam_role.worker_ec2.name}"]
  policy_arn = aws_iam_policy.worker_ec2.arn
}