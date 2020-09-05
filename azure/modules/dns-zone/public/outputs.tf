output "public_dns_zone_id" {
  value           = azurerm_dns_zone.public-dns-zone.id
  description     = "Terraform created the DNS Zone ID. ."
}