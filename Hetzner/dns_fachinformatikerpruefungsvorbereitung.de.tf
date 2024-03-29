data "hetznerdns_zone" "pruefungsvorbereitung" {
  name = "fachinformatikerpruefungsvorbereitung.de"
}

resource "hetznerdns_record" "pruefungsvorbereitung" {
  zone_id = data.hetznerdns_zone.pruefungsvorbereitung.id
  name    = "@"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}


resource "hetznerdns_record" "pruefungsvorbereitungWWW" {
  zone_id = data.hetznerdns_zone.pruefungsvorbereitung.id
  name    = "www"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "googleSearchVerifyFiPuev" {
  zone_id = data.hetznerdns_zone.pruefungsvorbereitung.id
  name    = "@"
  value   = "google-site-verification=i4fuD6Vqoo_2wvSbyvmrC8CQ8pO-ytNbzK6m7trmCe8"
  type    = "TXT"
  ttl     = 120
}
