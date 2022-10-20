data "hetznerdns_zone" "pruefungsvorbereitung" {
  name = "fachinformatikerpruefungsvorbereitung.de"
}

resource "hetznerdns_record" "pruefungsvorbereitung" {
  zone_id = data.hetznerdns_zone.pruefungsvorbereitung.id
  name    = "@"
  value   = module.kube-hetzner.load_balancer_public_ipv4
  type    = "A"
  ttl     = 86400
}


resource "hetznerdns_record" "pruefungsvorbereitungWWW" {
  zone_id = data.hetznerdns_zone.pruefungsvorbereitung.id
  name    = "www"
  value   = module.kube-hetzner.load_balancer_public_ipv4
  type    = "A"
  ttl     = 86400
}

# resource "hetznerdns_record" "googleSearchVerifyFiPv" {
#   zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
#   name    = "@"
#   value   = "google-site-verification=1OrQrIpwfPStQ2e_QwO3KBlHvmi2fVXwlyE7Lwm--XA"
#   type    = "TXT"
#   ttl     = 120
# }
