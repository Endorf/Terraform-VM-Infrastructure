# Environment

variable "environment" {
  description = "Deployment environment (dev/stage/live)"
  type        = string
  default     = "dev"
}


# Database

variable "db_user" {
  description = "database username"
  type        = string
  default     = "userdb"
}

variable "db_pass" {
  description = "database password"
  type        = string
  sensitive   = true
  default     = "asdkj_=lsdfkj123"
}
