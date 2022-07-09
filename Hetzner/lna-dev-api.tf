resource "hcloud_server" "api_lna-dev_com" {
  name         = "api.lna-dev.com.TF"
  server_type  = "cx11"
  image        = "ubuntu-20.04"
  location     = "nbg1"
  firewall_ids = [hcloud_firewall.API-Firewall.id]
}

resource "hcloud_firewall" "API-Firewall" {
  name = "API-Firewall"
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}