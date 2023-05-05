data "hetznerdns_zone" "fedodo_org" {
  name = "fedodo.org"
}

# Github Organisation Verification
resource "hetznerdns_record" "fedodoGitHubVerify" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "_github-challenge-Fedodo-org"
  value   = "604c443ac7"
  type    = "TXT"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodo_home" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "*"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodo_home_root" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "@"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}