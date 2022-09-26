data "hetznerdns_zone" "prüfungsvorbereitung" {
  name = "xn--fachinformatiker-prfungsvorbereitung-w0d.de"
}

# fachinformatiker-prüfungsvorbereitung.de
resource "hetznerdns_record" "prüfungsvorbereitung" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = "185.199.109.153"
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "prüfungsvorbereitung2" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = "185.199.108.153"
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "prüfungsvorbereitung3" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = "185.199.110.153"
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "prüfungsvorbereitung4" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = "185.199.111.153"
  type    = "A"
  ttl     = 86400
}

# fachinformatiker-prüfungsvorbereitung.de
resource "hetznerdns_record" "prüfungsvorbereitungWWW" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "www"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "googleSearchVerifyFiPv" {
  zone_id = data.hetznerdns_zone.prüfungsvorbereitung.id
  name    = "@"
  value   = "google-site-verification=1OrQrIpwfPStQ2e_QwO3KBlHvmi2fVXwlyE7Lwm--XA"
  type    = "TXT"
  ttl     = 120
}
