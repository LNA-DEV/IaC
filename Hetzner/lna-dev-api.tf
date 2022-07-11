resource "hcloud_server" "kubeMaster" {
  name         = "kubeMaster"
  server_type  = "cpx11"
  image        = "ubuntu-20.04"
  location     = "nbg1"
  user_data = replace(file("/Scripts/KubeInitMaster.sh"), "[ip-address]", kubeMaster.network.ip)

  network {
    network_id = hcloud_network.kubeNetwork.id
  }
}

resource "hcloud_server" "kubeNode" {
  count = 1
  name         = "kubeNode${count.index}"
  server_type  = "cpx11"
  image        = "ubuntu-20.04"
  location     = "nbg1"
  user_data = file("./Scripts/KubeInitNode.sh")

  network {
    network_id = hcloud_network.kubeNetwork.id
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