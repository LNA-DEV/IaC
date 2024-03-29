data "hetznerdns_zone" "lna_dev_de" {
  name = "lna-dev.de"
}

# lna-dev.de
resource "hetznerdns_record" "personalWebsiteWWWDE" {
  zone_id = data.hetznerdns_zone.lna_dev_de.id
  name    = "www"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

# lna-dev.de
resource "hetznerdns_record" "personalWebsiteDE" {
  zone_id = data.hetznerdns_zone.lna_dev_de.id
  name    = "@"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}
