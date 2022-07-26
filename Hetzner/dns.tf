# General
data "hetznerdns_zone" "dns_zone" {
  name = "lna-dev.net"
}


# TODO Use module output vars
# # Kubernetes
# resource "hetznerdns_record" "lna-dev_net" {
#   zone_id = data.hetznerdns_zone.dns_zone.id
#   name    = "@"
#   value   = hcloud_server.kubeMaster.ipv4_address
#   type    = "A"
#   ttl     = 120
# }

# resource "hetznerdns_record" "lna-dev_net2" {
#   zone_id = data.hetznerdns_zone.dns_zone.id
#   name    = "*"
#   value   = hcloud_server.kubeMaster.ipv4_address
#   type    = "A"
#   ttl     = 120
# }

# resource "hetznerdns_record" "kubectl" {
#   zone_id = data.hetznerdns_zone.dns_zone.id
#   name    = "kubectl"
#   value   = hcloud_server.kubeMaster.ipv4_address
#   type    = "A"
#   ttl     = 120
# }


# Mail
resource "hetznerdns_record" "mail1" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "10 mx00.ionos.de."
  type    = "MX"
  ttl     = 120
}

resource "hetznerdns_record" "mail2" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "20 mx01.ionos.de."
  type    = "MX"
  ttl     = 120
}


# me.lna-dev.net
resource "hetznerdns_record" "me" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "me"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# iac.lna-dev.net
resource "hetznerdns_record" "IaC" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "iac"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}
