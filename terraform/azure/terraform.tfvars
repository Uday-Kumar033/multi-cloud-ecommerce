location            = "Central India"
project_name        = "multi-cloud-ecommerce"
resource_group_name = "multi-cloud-ecommerce-rg"

vnet_cidr       = "10.10.0.0/16"
aks_subnet_cidr = "10.10.1.0/24"
db_subnet_cidr  = "10.10.2.0/24"

aks_node_count = 1
aks_vm_size    = "Standard_B2s"

db_admin_username = "ecommerce_admin"
db_admin_password = "CHANGE_THIS_TO_A_STRONG_PASSWORD"
