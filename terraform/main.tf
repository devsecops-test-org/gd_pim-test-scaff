data "aws_region" "current" {}

module "shared" {
  source = "./modules/shared"

  environment_tag = var.environment_tag
  domain          = var.domain
  region          = data.aws_region.current.name
  oidc_provider   = data.aws_iam_openid_connect_provider.oidc
}

