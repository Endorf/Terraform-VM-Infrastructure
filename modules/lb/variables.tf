# Environment

variable "vpc_id" {}

variable "public_subnet_ids" {}

variable "public_security_group_id" {
  description = "lb_public_security_group_id"
  type        = string
}

variable "environment" {}

variable "app_name" {}