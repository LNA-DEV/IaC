variable "hcloud_token" {
  sensitive   = true
  type        = string
  description = "Hetzner API-Token"
}

# variable "hcloud_dns_token" {
#   sensitive   = true
#   type        = string
#   description = "Hetzner DNS-API-Token"
# }

variable "ssh_public_key" {
  sensitive   = true
  type        = string
  description = "SSH Public Key"
}

variable "ssh_private_key" {
  sensitive   = true
  type        = string
  description = "SSH Private Key"
}
