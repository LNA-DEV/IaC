terraform {
  cloud {
    organization = "LNA-DEV"
    token = "c0GJjyUy8XbynA.atlasv1.JWBCIo0t5d6op164cKj9bvSFJ6mpqyOskUG70txsHuVCqKoVwcC66ukHAI8OqdwBc6E"    
    workspaces {
      name = "IaC_Hetzner"
    }
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.35.1"
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

# # Kubernetes
# module "kubernetes" {
#   source                      = "LNA-DEV/kubernetes/hetzner"
#   version                     = "1.1.25"
#   hcloud_token                = var.hcloud_token
#   kubeNodeCount               = 1
#   certifacteDomains           = ["api.lna-dev.net"]
#   loadBalancerDestinationPort = "30001"
#   kubeSecrets                 = var.kubeSecrets
# }
