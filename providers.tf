terraform {
  # required_version = ">= 0.14.0"
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "~> 0.15.0"
    }
  }
}

variable "api_url" {}
variable "org" {}
variable "space" {}

provider "cloudfoundry" {
    api_url = var.api_url
    # use SSO; set env CF_SSO_PASSCODE
    store_tokens_path = pathexpand("~/.cf/terraform.json")
    # use a space-developer; see https://docs.stackit.cloud/stackit/en/how-to-create-service-accounts-67772133.html
    # user = var.user
    # password = var.password
}