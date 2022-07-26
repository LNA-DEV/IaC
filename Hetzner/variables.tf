variable "hcloud_token" {
  sensitive   = true
  type        = string
  description = "Hetzner API-Token"
}

variable "hcloud_dns_token" {
  sensitive   = true
  type        = string
  description = "Hetzner DNS-API-Token"
}
