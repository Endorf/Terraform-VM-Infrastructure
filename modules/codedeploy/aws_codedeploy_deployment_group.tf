resource "aws_codedeploy_deployment_group" "infrademo" {
  app_name              = "${aws_codedeploy_app.infrademo.name}"
  deployment_group_name = "${ var.environment_name }"
  service_role_arn      = "${ var.aws_iam_worker_role.arn }" 
  depends_on            = [var.aws_autoscaling_group]
  deployment_config_name = "CodeDeployDefault.OneAtATime"

  autoscaling_groups = [
    var.aws_autoscaling_group.name
  ]

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["tf-infra-demo-alarm"]
    enabled = true
  }
}