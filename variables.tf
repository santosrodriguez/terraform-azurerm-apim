variable "solution_name" {
  description = "Solution name for Azure CAF naming"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "sku_name" {
  description = "SKU name for API Management (e.g., Developer, Standard, Premium)"
  type        = string
  default     = "Developer"
}

variable "publisher_name" {
  description = "Publisher name for API Management"
  type        = string
}

variable "publisher_email" {
  description = "Publisher email for API Management"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for APIM virtual network configuration"
  type        = string
}

variable "zones" {
  description = "Availability zones for resources (only supported in Premium SKU for APIM)"
  type        = list(string)
  default     = ["1", "2", "3"]
}
