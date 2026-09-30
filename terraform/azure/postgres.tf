resource "azurerm_postgresql_flexible_server" "main" {
  name                = "${var.project_name}-postgres"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  version = "16"

  delegated_subnet_id = azurerm_subnet.database.id
  private_dns_zone_id = azurerm_private_dns_zone.postgres.id

  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password

  storage_mb = 32768

  sku_name = "B_Standard_B1ms"

  backup_retention_days = 7

  zone = "1"

  tags = {
    Project     = var.project_name
    Environment = "production"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.postgres
  ]
}

resource "azurerm_postgresql_flexible_server_database" "ecommerce" {
  name      = "ecommerce"
  server_id = azurerm_postgresql_flexible_server.main.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
