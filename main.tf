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
  region  = "us-east-1"
}

locals {
  environment_name = terraform.workspace
}

module "application_web" {
  source = "./modules/app"

  # Input Variables
  bucket_prefix    = "web-app-{local.environment_name}"
  app_name         = "web-app"
  environment_name = var.environment_name
  create_dns_zone  = terraform.workspace == "live" ? true : false
  instance_type    = "t3.micro"
  db_name          = var.db_name
  db_user          = var.db_user
  db_pass          = var.db_pass
}