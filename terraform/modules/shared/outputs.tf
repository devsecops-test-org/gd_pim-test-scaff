output "kms_key_arn" {
  value = module.kms.key_arn
}

output "shared_iam_policy_docs" {
  value = {
    kms_access = data.aws_iam_policy_document.iam_kms_usage.json
  }
}