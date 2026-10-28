# Azure API Management Terraform Module

## Introduction
This module deploys an Azure API Management instance joined to a private virtual network subnet.

## Usage

```hcl
module "apim" {
  source = "caresource.pe.jfrog.io/shared-tfmodules-internal__network/apim/azurerm"
  version = "0.1.0"
  environment = var.environment
  private_endpoint_subnet_id = "/subscriptions/../resourceGroups/../providers/Microsoft.Network/virtualNetworks/../subnets/.."
  publisher_email = var.publisher_email
  publisher_name = var.publisher_name
  resource_group_name = var.resource_group_name
  sku_name = var.sku_name
  solution_name = var.solution_name
}
```

## Inputs
| Name                                | Type           | Description                                        | Default    |
|--------------------------------------|----------------|----------------------------------------------------|------------|
| environment                          | string         | The environment name (e.g. dev, test, prod), used in resource naming. | n/a |
| private_endpoint_subnet_id           | string         | The subnet ID to attach the API Management instance's virtual network configuration to. | n/a |
| publisher_email                      | string         | The email address of the API publisher. | n/a |
| publisher_name                       | string         | The name of the API publisher. | n/a |
| resource_group_name                  | string         | The name of the resource group in which to deploy the API Management instance. | n/a |
| sku_name                              | string         | The SKU (name and capacity) of the API Management instance. | n/a |
| solution_name                        | string         | The name of the solution, used in resource naming. | n/a |

## Outputs
| Name                                  | Description                              |
|-----------------------------------------|-------------------------------------------|
| apim_id                                  | The resource ID of the API Management instance. |
| apim_name                                | The name of the API Management instance. |
| apim_sku_name                            | The SKU name of the API Management instance. |
| apim_managed_identity_id                 | The principal ID of the API Management instance's system-assigned managed identity. |
| apim_public_ip_addresses                 | The public IP addresses of the API Management instance. |
| apim_private_ip_addresses                | The private IP addresses of the API Management instance. |

## Features

- Creates an Azure API Management instance with a system-assigned managed identity
- Generates a unique resource name using the azurecaf provider and a random suffix
- Joins the instance to a virtual network subnet for internal connectivity
- Supports configurable public network access and SKU

## Requirements

- Terraform >= 1.4.0
- AzureRM >= 3.0
