output "apim_id" {
  value = azurerm_api_management.apim.id
}

output "apim_name" {
  value = azurerm_api_management.apim.name
}

output "apim_sku_name" {
  value = azurerm_api_management.apim.sku_name
}

output "apim_managed_identity_principal_id" {
  value = azurerm_api_management.apim.identity[0].principal_id
}

output "apim_public_ip_addresses" {
  value = azurerm_api_management.apim.public_ip_addresses
}

output "apim_private_ip_addresses" {
  value = azurerm_api_management.apim.private_ip_addresses
}
