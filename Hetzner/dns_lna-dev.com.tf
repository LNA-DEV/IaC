data "hetznerdns_zone" "lna_dev_com" {
  name = "lna-dev.com"
}

# lna-dev.com
resource "hetznerdns_record" "personalWebsiteWWWCOM" {
  zone_id = data.hetznerdns_zone.lna_dev_com.id
  name    = "www"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

# lna-dev.com
resource "hetznerdns_record" "personalWebsiteCOM" {
  zone_id = data.hetznerdns_zone.lna_dev_com.id
  name    = "@"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}
