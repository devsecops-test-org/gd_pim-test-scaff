# EKS
data "aws_eks_cluster" "eks" {
  name = join("-", ["gucci-digital", var.account])
}

data "aws_iam_openid_connect_provider" "oidc" {
  url = data.aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

# Network & Security
data "aws_subnets" "private_subnet_ids" {
  filter {
    name   = "tag:TerraformTags"
    values = ["private"]
  }
}

data "aws_subnets" "unrouted_subnet_ids" {
  filter {
    name   = "tag:TerraformTags"
    values = ["unrouted"]
  }
}

data "aws_subnet" "private_subnet" {
  for_each = toset(data.aws_subnets.private_subnet_ids.ids)
  id       = each.value
}

data "aws_subnet" "unrouted_subnet" {
  for_each = toset(data.aws_subnets.unrouted_subnet_ids.ids)
  id       = each.value
}

data "aws_security_groups" "pods" {
  tags = {
    Service = "platform"
    Name    = "eks-cluster-sg-gucci-digital-*"
  }
} # data.aws_security_groups.pods.ids

data "aws_vpc" "selected" {
  tags = { Name = "gucci-digital-*-vpc" }
} # data.aws_vpc.gucci_vpc.id
