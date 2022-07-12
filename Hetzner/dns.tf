data "hetznerdns_zone" "dns_zone" {
    name = "lna-dev.net"
}

resource "hetznerdns_record" "empty" {
    zone_id = data.hetznerdns_zone.dns_zone.id
    name = "@"
    value = hcloud_server.kubeMaster.ipv4_address
    type = "A"
    ttl= 120
}

resource "hetznerdns_record" "kubectl" {
    zone_id = data.hetznerdns_zone.dns_zone.id
    name = "kubectl"
    value = hcloud_server.kubeMaster.ipv4_address
    type = "A"
    ttl= 120
}