resource "aws_vpc" "vpc" { #tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs:exp:2023-10-24
  cidr_block = var.cidr_block

  tags = {
    Name = var.app_name
  }
}
