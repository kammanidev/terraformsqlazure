variable "resource_group" {
  default     = "mysql-rg"
  description = "The name of the resource group in which to create the MySQL Server. Changing this forces a new resource to be created."
}

variable "prefix" {
  default     = ""
  description = "An optional prefix to use in naming schemes, sometimes unique names are required."
}

variable "my_environment" {
  default     = "production"
  description = "An environment might have implications on naming schemes, or deployment options."
}

variable "envname" {
  type    = "map" 
  default = {
    "production" = ""
    "development" = "-dev"
    "accept" = "-acc"
    "test" = "-tst"
  }
  description = "This environment name map constructs the name of the resource to be created."
}

variable "location" {
  default     = "westeurope"
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "tags" {
  type    = "map"
  default = {
    "Project" = "Some project nr. 010011"
  }
  description = "A mapping of tags to assign to the resource. For instance business stakeholders, or who pays for it?"
}

variable "db_server_name" {
  default     = ""
  description = "Specifies the name of the MySQL Server. Changing this forces a new resource to be created. This needs to be globally unique within Azure."
}

variable "admin_username" {
  default     = "mysqladminun"
  description = "The Administrator Login for the MySQL Server. Changing this forces a new resource to be created."
}

variable "admin_password" {
  default     = "H@Sh1CoR3!"
  description = "The Password associated with the administrator_login for the MySQL Server."
}

variable "mysql_server_version" {
  default     = "5.7"
  description = "Specifies the version of MySQL to use. Valid values are 5.6 and 5.7. Changing this forces a new resource to be created."
}

variable "sku_name" {
  default     = "B_Gen5_2"
  description = "Specifies the SKU name for the MySQL Server. This name may get updated with newer versions, check the API."
}

variable "sku_capacity" {
  default     = 2
  description = "The scale up/out capacity, representing server's compute units."
}

variable "sku_tier" {
  default     = "Basic"
  description = "The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized."
}

variable "sku_family" {
  default     = "Gen5"
  description = "The family of hardware."
}

variable "enforce_ssl_mysql" {
  default     = "Enabled"
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
}

variable "storage_mb" {
  default     = "5120"
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
}

variable "backup_retention_days" {
  default     = "7"
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
}

variable "geo_redundant_backup" {
  default     = "Disabled"
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
}

# The Azure feature Allow access to Azure services can be enabled 
# by setting start_ip_address and end_ip_address to 0.0.0.0 which
# is documented in the Azure API Docs.
variable "start_ip_address" {
  default     = "0.0.0.0"
  description = "Specifies the Start IP Address associated with this Firewall Rule. Changing this forces a new resource to be created."
}

variable "end_ip_address" {
  default     = "0.0.0.0"
  description = "Specifies the End IP Address associated with this Firewall Rule. Changing this forces a new resource to be created."
}

variable "firewall_rule_name" {
  default     = "AllowAllAzureIPs"
  description = "Specifies the name of the MySQL Firewall Rule. Changing this forces a new resource to be created."
}

variable "db_name" {
  default     = "mydb"
  description = "Specifies the name of the MySQL Database, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created."
}

variable "charset" {
  default     = "utf8"
  description = "Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created."
}

variable "collation" {
  default     = "utf8_unicode_ci"
  description = "Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created."
}

variable "create_lock" {
  default     = true
  description = "Whether to lock the resource group or not. true enables the lock, false does not lock the resource group."
}

variable "resource_lock_name" {
  default     = "lock-on-resource-group"
  description = "Specifies the name of the Management Lock. Changing this forces a new resource to be created."
}

variable "lock_level" {
  default     = "CanNotDelete"
  description = "Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created."
}

variable "notes" {
  default     = "This Resource Group is locked to prevent unintended deletion."
  description = "Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created."
}
