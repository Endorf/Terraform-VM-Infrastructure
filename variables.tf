# Database

variable "db_user" {
  description = "database username"
  type        = string
  default     = "userdbtest"
}

variable "db_pass" {
  description = "database password"
  type        = string
  sensitive   = true
}
