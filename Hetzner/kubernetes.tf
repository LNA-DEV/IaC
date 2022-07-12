resource "hcloud_server" "kubeMaster" {
  name         = "kubeMaster"
  server_type  = "cpx11"
  image        = "ubuntu-20.04"
  location     = "nbg1"
  user_data = replace(file("./Scripts/KubeInitMaster.sh"), "[REPLACE]", sum(["${var.kubeNodeCount}", 1]))

  network {
    network_id = hcloud_network.kubeNetwork.id
    ip = "10.0.1.1"
  }
}

variable "kubeNodeCount" {
  type = number
  description = "Count of Kubernetes Nodes"
  default = 1
}

resource "hcloud_server" "kubeNode" {
  count = var.kubeNodeCount
  name         = "kubeNode${count.index}"
  server_type  = "cpx11"
  image        = "ubuntu-20.04"
  location     = "nbg1"
  user_data = file("./Scripts/KubeInitNode.sh")

  network {
    network_id = hcloud_network.kubeNetwork.id
    ip = replace("10.0.1.X", "X", sum(["${count.index}", 2]))
  }
}

resource "hcloud_network" "kubeNetwork" {
  name     = "kubeNetwork"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "kubeNetworkSubnet" {
  type         = "cloud"
  network_id   = hcloud_network.kubeNetwork.id
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

data "hetznerdns_zone" "dns_zone" {
    name = "lna-dev.net"
}

resource "hetznerdns_record" "empty" {
    zone_id = data.hetznerdns_zone.dns_zone.id
    name = "@"
    value = hcloud_server.kubeMaster.ipv4_address
    type = "A"
    ttl= 120
}

resource "hetznerdns_record" "kubectl" {
    zone_id = data.hetznerdns_zone.dns_zone.id
    name = "kubectl"
    value = hcloud_server.kubeMaster.ipv4_address
    type = "A"
    ttl= 120
}