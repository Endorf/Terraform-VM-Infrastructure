output "instance_1_ip_addr" {
  value = aws_instance.instance_A.public_dns
}

output "instance_2_ip_addr" {
  value = aws_instance.instance_B.public_dns
}

output "db_instance_addr" {
  value = aws_db_instance.db_instance.address
}