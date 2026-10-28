terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "suffix" {
  length = 4
  upper = false
  special = false
  numeric = true
  lower = false
}

data "azurecaf_name" "apim_name" {
  resource_type = "azurerm_api_management"
  suffixes = [ var.solution_name, var.location, var.environment, random_string.suffix.result ]
}

data "azurecaf_name" "pip" {
  resource_type = "azurerm_public_ip"
  suffixes = [ var.solution_name, var.location, var.environment, random_string.suffix.result ]  
}

resource "azurerm_public_ip" "apim_pip" {
  name                = data.azurecaf_name.pip.result
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.zones
  domain_name_label   = lower(replace(data.azurecaf_name.pip.result, "-", ""))
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_api_management" "apim" {
  name                 = data.azurecaf_name.apim_name.result
  location             = var.location
  resource_group_name  = var.resource_group_name
  publisher_name       = var.publisher_name
  publisher_email      = var.publisher_email
  public_ip_address_id = azurerm_public_ip.apim_pip.id # The public IP address resource is required when setting up the virtual network for either external or internal access. With an internal virtual network, the public IP address is used only for management operations.
  sku_name             = var.sku_name
  virtual_network_type = "Internal"
  zones                = var.zones # Only supported in Premium SKU
  identity {
    type = "SystemAssigned"
  }
  virtual_network_configuration {
    subnet_id = var.subnet_id
  }
  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
