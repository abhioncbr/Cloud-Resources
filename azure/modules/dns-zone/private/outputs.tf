output "private_dns_zone_id" {
  value           = azurerm_private_dns_zone.private-dns-zone.id
  description     = "Terraform created the DNS Zone ID. ."
}