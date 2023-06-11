resource "aws_iam_role_policy_attachment" "infrademo_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = "${var.aws_iam_worker_role.name}"
}