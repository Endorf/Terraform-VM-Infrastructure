# Database

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