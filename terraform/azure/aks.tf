resource "azurerm_kubernetes_cluster" "main" {
  name                = "${var.project_name}-aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  dns_prefix = "multi-cloud-ecommerce"

  kubernetes_version = null

  default_node_pool {
    name            = "system"
    node_count      = var.aks_node_count
    vm_size         = var.aks_vm_size
    vnet_subnet_id  = azurerm_subnet.aks.id
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Project     = var.project_name
    Environment = "production"
    ManagedBy   = "Terraform"
    Cloud       = "Azure"
  }
}
