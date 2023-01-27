data "hetznerdns_zone" "fedodo_social" {
  name = "fedodo.social"
}

# fedodo.social
resource "hetznerdns_record" "fedodo_WWW" {
  zone_id = data.hetznerdns_zone.fedodo_social.id
  name    = "www"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodo" {
  zone_id = data.hetznerdns_zone.fedodo_social.id
  name    = "@"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

# dev.fedodo.social
resource "hetznerdns_record" "DEV_fedodo_WWW" {
  zone_id = data.hetznerdns_zone.fedodo_social.id
  name    = "www.dev"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "DEV_fedodo" {
  zone_id = data.hetznerdns_zone.fedodo_social.id
  name    = "dev"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}
