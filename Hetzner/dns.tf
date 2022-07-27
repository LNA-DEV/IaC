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
