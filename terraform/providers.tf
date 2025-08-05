terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      CreationMethod     = "terraform"
      Environment        = var.environment_tag
      Owner              = var.domain
      Domain             = var.domain
      DataClassification = "Confidential"
      Account            = var.account
      ComplianceStandard = "AWS"
      IacRepository      = element(split("/", path.cwd), length(split("/", path.cwd)) - 1)
    }
  }
}