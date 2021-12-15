output "fqdn" {
    value       = "${azurerm_mysql_server.mysql.fqdn}"
    description = "The Fully Qualified Domain Name of the MySQL Server."
}

output "db_server_name" {
    value       = "${azurerm_mysql_server.mysql.name}"
    description = "The name of the MySQL Server."
}

output "db_name" {
    value       = "${azurerm_mysql_database.mysql.name}"
    description = "The name of the database on the MySQL Server."
}

output "admin_username" {
    value       = "${var.admin_username}"
    description = "The administrator login name of the MySQL Server."
}
