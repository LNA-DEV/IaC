data "hetznerdns_zone" "fedodo_social" {
  name = "fedodo.social"
}

# fedodo.social
resource "hetznerdns_record" "fedodo" {
  zone_id = data.hetznerdns_zone.fedodo_social.id
  name    = "*"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}
