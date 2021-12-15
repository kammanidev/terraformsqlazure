resource "azurerm_resource_group" "mysql" {
  name     = "${local.name_prefix}${var.resource_group}${local.name_suffix}"
  location = "${var.location}"
	tags     = "${var.tags}"
}

resource "azurerm_mysql_server" "mysql" {
  name                = "${local.name_prefix}${var.db_server_name}${local.name_suffix}"
  location            = "${azurerm_resource_group.mysql.location}"
  resource_group_name = "${azurerm_resource_group.mysql.name}"

  sku {
    name     = "${var.sku_name}"
    capacity = "${var.sku_capacity}"
    tier     = "${var.sku_tier}"
    family   = "${var.sku_family}"
  }

  storage_profile {
    storage_mb            = "${var.storage_mb}"
    backup_retention_days = "${var.backup_retention_days}"
    geo_redundant_backup  = "${var.geo_redundant_backup}"
  }

  administrator_login          = "${var.admin_username}"
  administrator_login_password = "${var.admin_password}"
  version                      = "${var.mysql_server_version}"
  ssl_enforcement              = "${var.enforce_ssl_mysql}"
}

resource "azurerm_mysql_database" "mysql" {
  name                = "${var.db_name}${local.name_suffix}"
  resource_group_name = "${azurerm_resource_group.mysql.name}"
  server_name         = "${azurerm_mysql_server.mysql.name}"
  charset             = "${var.charset}"
  collation           = "${var.collation}"
}

resource "azurerm_mysql_firewall_rule" "mysql" {
  name                = "${var.firewall_rule_name}${local.name_suffix}"
  resource_group_name = "${azurerm_resource_group.mysql.name}"
  server_name         = "${azurerm_mysql_server.mysql.name}"
  start_ip_address    = "${var.start_ip_address}"
  end_ip_address      = "${var.end_ip_address}"
}

resource "azurerm_management_lock" "conditional" {
  count      = "${var.create_lock ? 1 : 0}"
  name       = "${var.resource_lock_name}${local.name_suffix}"
  scope      = "${azurerm_resource_group.mysql.id}"
  lock_level = "${var.lock_level}"
  notes      = "${var.notes}"
}
