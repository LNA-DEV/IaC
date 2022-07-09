terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.34.3"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "hcloud_token" {
  sensitive   = true # Requires terraform >= 0.14
  type        = string
  description = "Hetzner API-Token"
}




resource "hcloud_server" "web" {
  name        = "lol"
  server_type = "cx11"
  image       = "ubuntu-20.04"
}
