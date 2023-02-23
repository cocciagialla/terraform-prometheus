terraform {
  required_version = ">= 1.0.0"

  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.29.4"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}
