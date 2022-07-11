resource "hcloud_server" "kubeMaster" {
  name         = "kubeMaster"
  server_type  = "cpx11"
  image        = "ubuntu-20.04"
  location     = "nbg1"
  user_data = file("/Scripts/KubeInitMaster.sh")

  network {
    network_id = hcloud_network.kubeNetwork.id
    ip = "10.0.1.1"
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