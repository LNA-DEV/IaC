data "hetznerdns_zone" "prüfungsvorbereitung" {
  name = "xn--fachinformatiker-prfungsvorbereitung-w0d.de"
}

resource "hetznerdns_record" "prüfungsvorbereitung" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = module.kube-hetzner.load_balancer_public_ipv4
  type    = "A"
  ttl     = 86400
}


resource "hetznerdns_record" "prüfungsvorbereitungWWW" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "www"
  value   = module.kube-hetzner.load_balancer_public_ipv4
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "googleSearchVerifyFiPv" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = "google-site-verification=1OrQrIpwfPStQ2e_QwO3KBlHvmi2fVXwlyE7Lwm--XA"
  type    = "TXT"
  ttl     = 120
}
