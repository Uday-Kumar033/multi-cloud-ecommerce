variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "multi-cloud-ecommerce"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "multi-cloud-ecommerce-rg"
}

variable "vnet_cidr" {
  description = "Azure VNet CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "aks_subnet_cidr" {
  description = "AKS subnet CIDR"
  type        = string
  default     = "10.10.1.0/24"
}

variable "db_subnet_cidr" {
  description = "PostgreSQL subnet CIDR"
  type        = string
  default     = "10.10.2.0/24"
}

variable "aks_node_count" {
  description = "AKS node count"
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "db_admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "ecommerce_admin"
}

variable "db_admin_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}
