output "public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}
output "nsg_id" {
  value = azurerm_network_security_group.vm_nsg.id
}
