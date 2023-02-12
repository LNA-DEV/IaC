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