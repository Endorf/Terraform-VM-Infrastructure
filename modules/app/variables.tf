# Environment

variable "environment_name" {
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
  default     = "ami-0715c1897453cabd1"
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
  default     = "app_db"
}

variable "db_user" {
  description = "database username"
  type        = string
  default     = "admin"
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