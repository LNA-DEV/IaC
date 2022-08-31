# General
data "hetznerdns_zone" "dns_zone" {
  name = "lna-dev.net"
}


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


# thk.lna-dev.net
resource "hetznerdns_record" "thk" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "thk"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# api.lna-dev.net
resource "hetznerdns_record" "api" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "api"
  value   = module.kubernetes.loadBalancerIp
  type    = "A"
  ttl     = 120
}

# Common Extensions
# ce.lna-dev.net
resource "hetznerdns_record" "ce" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "ce"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# Privacy Tools
# privacy.lna-dev.net
resource "hetznerdns_record" "privacy" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "privacy"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# LNA-Photo
# photo.lna-dev.net
resource "hetznerdns_record" "photo" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "photo"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# LNA-Blog
# blog.lna-dev.net
resource "hetznerdns_record" "blog" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "blog"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# Fachinformatiker Prüfungsvorbereitung
# fi.lna-dev.net
resource "hetznerdns_record" "fi" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "fi"
  value   = "lna-dev.github.io."
  type    = "CNAME"
  ttl     = 120
}

# Google Search Verfication
resource "hetznerdns_record" "googleSearchVerify" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "google-site-verification=sNfojWYtYmoN35amaR62HH34NAfLyL_CvI8CHKdUjUw"
  type    = "TXT"
  ttl     = 120
}