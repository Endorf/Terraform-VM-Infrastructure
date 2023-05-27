# Database

variable "db_user" {
  description = "database user name"
  type        = string
  default     = "userdb"
}

variable "db_pass" {
  description = "database password"
  type        = string
  sensitive   = true
}
