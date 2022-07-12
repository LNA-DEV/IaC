terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.34.3"
    }
     hetznerdns = {
      source = "timohirt/hetznerdns"
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
  sensitive   = true # Requires terraform >= 0.14
  type        = string
  description = "Hetzner API-Token"
}

variable "hcloud_dns_token" {
  sensitive   = true # Requires terraform >= 0.14
  type        = string
  description = "Hetzner DNS-API-Token"
}