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

# Common Extensions
# ce.lna-dev.net
resource "hetznerdns_record" "ce" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "ce"
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

# lna-dev.net
resource "hetznerdns_record" "lnadev" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "*"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

resource "hetznerdns_record" "personalWebsite" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = module.kube-hetzner.ingress_public_ipv4
  type    = "A"
  ttl     = 86400
}

# Brave Verification
resource "hetznerdns_record" "personalWebsiteBraveVerification" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "brave-ledger-verification=cb3f4b592a2f3859d2e6a9a9e6fde085cc86551420fcbe7b21e339864962b2e2"
  type    = "TXT"
  ttl     = 86400
}

# Tutnaota
resource "hetznerdns_record" "lna_dev_netTutanotaVerify" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "t-verify=78e08942b3e1ea847ee37d661afefbf9"
  type    = "TXT"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_dev_tutanoto_spf" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "\"v=spf1 include:spf.tutanota.de -all\""
  type    = "TXT"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_devTutanotaMail" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "@"
  value   = "15 mail.tutanota.de."
  type    = "MX"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_devTutanotaDomainKey" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "s1._domainkey"
  value   = "s1.domainkey.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_devTutanotaDomainKey2" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "s2._domainkey"
  value   = "s2.domainkey.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_devTutanotaMta" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "_mta-sts"
  value   = "mta-sts.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_devTutanotaMta2" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "mta-sts"
  value   = "mta-sts.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "lna_devTutanotaDmarc" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "_dmarc"
  value   = "\"v=DMARC1; p=quarantine; adkim=s\""
  type    = "TXT"
  ttl     = 86400
}