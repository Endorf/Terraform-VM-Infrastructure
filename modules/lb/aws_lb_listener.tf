resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.public.arn

  port     = 80
  protocol = "HTTP" #tfsec:ignore:aws-elb-http-not-used

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}