module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 3.0"

  description             = "${var.domain} ${var.application} encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false

  enable_default_policy = true
  key_statements = [
    {
      sid = "BuildRoleAccess"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt",
        "kms:GenerateDataKey",
        "kms:Describe*",
        "kms:List*",
        "kms:CreateGrant"
      ]
      resources = ["*"]

      principals = [
        {
          type        = "AWS"
          identifiers = ["arn:aws:iam::851725517885:role/${var.domain}-build-gha-role"]
        }
      ]
    }
  ]

  aliases = ["${var.domain}-${var.application}-${var.environment_tag}-encryption-key"]

  tags = {
    Name    = "${var.domain}-${var.application}-${var.environment_tag}-encryption-key",
    Service = "${var.domain}-${var.application}-${var.environment_tag}-kms"
  }

}