module "kube-hetzner" {
  providers = {
    hcloud = hcloud
  }
  hcloud_token = var.hcloud_token

  source = "kube-hetzner/kube-hetzner/hcloud"

  # Basic settings
  cluster_name = "cluster-v2"

  ssh_public_key = var.ssh_public_key
  ssh_private_key = var.ssh_private_key

  network_region = "eu-central"
  
  # Defining a single node pool that acts as both control plane and worker
  control_plane_nodepools = [
    {
      name        = "main-nodepool"
      server_type = "cx22"
      location    = "fsn1"
      labels      = []
      taints      = []
      count       = 3
    }
  ]

  agent_nodepools = [
    {
      name        = "agent-small",
      server_type = "cx22",
      location    = "fsn1",
      labels      = [],
      taints      = [],
      count       = 0
    }
  ]

  traefik_redirect_to_https = false

  enable_longhorn = true
  
  # Allow workloads on control plane nodes
  allow_scheduling_on_control_plane = true
  
  # Automatic updates
  automatically_upgrade_k3s = true
  automatically_upgrade_os  = true

  load_balancer_type     = "lb11"
  load_balancer_location = "fsn1"
}

output "kubeconfig" {
  value     = module.kube-hetzner.kubeconfig
  sensitive = true
}

output "ip" {
  value     = module.kube-hetzner.ingress_public_ipv4
  sensitive = false
}