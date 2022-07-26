terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.34.3"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "2.1.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "hetznerdns" {
  apitoken = var.hcloud_dns_token
}

variable "hcloud_token" {
  sensitive   = true
  type        = string
  description = "Hetzner API-Token"
}

variable "hcloud_dns_token" {
  sensitive   = true
  type        = string
  description = "Hetzner DNS-API-Token"
}

# Kubernetes
module "kubernetes" {
  source        = "LNA-DEV/kubernetes/hetzner"
  version       = "1.1.11"
  hcloud_token  = var.hcloud_token
  kubeNodeCount = 1
}
