terraform {
  backend "s3" {
    bucket         = "awsmybucket-25072023"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  environment = terraform.workspace
}

module "web_application" {
  source = "./modules/app"

  # Input Variables
  bucket_prefix    = "web-app-${local.environment}"
  app_name         = "web-app"
  environment = local.environment
  create_dns_zone  = terraform.workspace == "live" ? true : false
  instance_type    = "t3.micro"
  db_name          = "webapp${local.environment}db"
  db_user          = var.db_user
  db_pass          = var.db_pass
}
