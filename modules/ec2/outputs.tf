output "autoscaling_group" {
  value       = aws_autoscaling_group.worker
  description = "autoscaling_group_name"
}

output "aws_iam_worker_policy" {
  value       = aws_iam_policy.worker_ec2
  description = "aws_iam_worker_policy"
}

output "aws_iam_worker_role" {
  value       = aws_iam_role.worker_ec2
  description = "aws_iam_worker_role"
}