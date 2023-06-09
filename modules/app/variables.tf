# Environment

variable "environment" {
  description = "Deployment environment (dev/stage/live)"
  type        = string
  default     = "dev"
}

variable "app_name" {
  description = "Web application"
  type        = string
  default     = "web-app"
}


# EC2

variable "ami" {
  description = "amazon ec2 instance"
  type        = string
  default     = "ami-04a0ae173da5807d3"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.micro"
}


# S3

variable "bucket_prefix" {
  description = "prefix for s3 app bucket"
  type        = string
}


# RDS

variable "db_name" {
  description = "database name"
  type        = string
  default     = "appdb"
}

variable "db_user" {
  description = "database username"
  type        = string
  default     = "dbuser"
}

variable "db_pass" {
  description = "database password"
  type        = string
  sensitive   = true
}


# Route 53

variable "create_dns_zone" {
  description = "If true, new route53 zone will be created"
  type        = bool
  default     = false
}