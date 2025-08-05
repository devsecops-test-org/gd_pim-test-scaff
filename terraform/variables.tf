variable "domain" {
  type        = string
  description = "The domain for this project"
  default     = "pim"
}

variable "product" {
  type        = string
  description = "The product for this project"
  default     = "sdfsdf"
}

variable "environment_tag" {
  type        = string
  description = "Environment tag"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "assume_role" {
  description = "Role for the AWS provider to assume when deploy cross-account. When `null` the DevOps account is uses. Default: null"
  default     = null
}

variable "account" {
  type    = string
  default = "nonprod"
}
