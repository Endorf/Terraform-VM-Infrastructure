# Environment

variable "environment_name" {
  description = "Deployment environment (dev/stage/live)"
  type        = string
  default     = "dev"
}


# Database

variable "db_name" {
  description = "database name"
  type        = string
  default     = "web_app_db"
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
  default     = "admin" # Must be removed
}