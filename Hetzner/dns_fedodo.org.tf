data "hetznerdns_zone" "fedodo_org" {
  name = "fedodo.org"
}

# Github Organisation Verification
resource "hetznerdns_record" "fedodoGitHubVerify" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "_github-challenge-fedodo-org"
  value   = "604c443ac7"
  type    = "TXT"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaVerify" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "@"
  value   = "t-verify=69d2354bdb7fa69d0d17fdc9e8d64e20"
  type    = "TXT"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodo_tutanoto_spf" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "@"
  value   = "\"v=spf1 include:spf.tutanota.de -all\""
  type    = "TXT"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaMail" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "@"
  value   = "mail.tutanota.de."
  type    = "MX"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaDomainKey" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "s1._domainkey"
  value   = "s1.domainkey.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaDomainKey2" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "s2._domainkey"
  value   = "s2.domainkey.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaMta" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "_mta-sts"
  value   = "mta-sts.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaMta2" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "mta-sts"
  value   = "mta-sts.tutanota.de."
  type    = "CNAME"
  ttl     = 86400
}

resource "hetznerdns_record" "fedodoTutanotaDmarc" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=quarantine; adkim=s"
  type    = "CNAME"
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

resource "hetznerdns_record" "googleSearchVerifyFedodoOrg" {
  zone_id = data.hetznerdns_zone.fedodo_org.id
  name    = "@"
  value   = "google-site-verification=mIDwtSoK1jhW75C4YkotoXSR5IpFxMr1E0JZpp_VBts"
  type    = "TXT"
  ttl     = 86400
}
