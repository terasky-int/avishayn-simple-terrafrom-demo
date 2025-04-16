provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      terraform = "true"
      project   = var.project
      Purpose   = var.Purpose
    }
  }

  profile = var.profile
  ignore_tags {
    # Ignore tags added by the "Resource Auto Tagger" tool
    keys = ["Created By", "Creation Date", "IAM Role Name", "Iam User Name"]
  }
}