data "aws_iam_policy_document" "iam_kms_usage" {
  statement {
    sid    = "allowRead"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:GenerateDataKey"
    ]
    resources = [
      module.kms.key_arn
    ]
  }
}
