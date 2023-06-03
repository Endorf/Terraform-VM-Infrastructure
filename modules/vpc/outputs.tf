output "vpc_id" {
  value = aws_vpc.vpc.id
  description = "aws_vpc_id"
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
  description = "aws_alb_security_group_id"
}

output "instance_security_group_id" {
  value = aws_security_group.instance.id
  description = "aws_alb_security_group_id"
}

output "subnets_A" {
  value = {
    public   = aws_subnet.public_subnet1
    private = aws_subnet.private_subnet1
  }
}

output "subnets_B" {
  value = {
    public   = aws_subnet.public_subnet2
    private = aws_subnet.private_subnet2
  }
}