# terraform-azurerm-mysql
A terraform module to create a basic MySQL on Azure database server including a database. Numeral input options can be specified if desired, including setting a resource lock or not.

## Usage

```hcl
module "my_mysql" {
  source            = "han-nl/mysql/azurerm"
  version           = "0.1.0"
  location          = "westeurope"
  my_environment    = "production"
  db_server_name    = "mydb"
  tags {
      Project       = "Some project number 010011"
      Contact       = "Some Business Contact Person"
  }
}
```
## Inputs

### resource_group
The resource group where the resource should be created.

### prefix
An optional prefix to use in naming schemes, sometimes unique names are required.

### my_environment
An environment might have implications on naming schemes, or deployment options.

### location
Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

### tags
A mapping of tags to assign to the resource. For instance business stakeholders, or who pays for it?

### db_server_name
Specifies the name of the MySQL Server. Changing this forces a new resource to be created. This needs to be globally unique within Azure.

### admin_username
The Administrator Login for the MySQL Server. Changing this forces a new resource to be created.

### admin_password
The Password associated with the administrator_login for the MySQL Server.

### mysql_server_version
Specifies the version of MySQL to use. Valid values are 5.6 and 5.7. Changing this forces a new resource to be created.

### sku_name
Specifies the SKU name for the MySQL Server. This name may get updated with newer versions, check the API.

### sku_capacity
The scale up/out capacity, representing server's compute units.

### sku_tier
The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized.

### sku_family
The family of hardware.

### enforce_ssl_mysql
Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled.

### storage_mb
Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs.

### backup_retention_days
Backup retention days for the server, supported values are between 7 and 35 days.

### geo_redundant_backup
Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier.



### start_ip_address
Specifies the Start IP Address associated with this Firewall Rule. Changing this forces a new resource to be created.

The Azure feature Allow access to Azure services can be enabled by setting start_ip_address and end_ip_address to 0.0.0.0 which is documented in the Azure API Docs.

### end_ip_address
Specifies the End IP Address associated with this Firewall Rule. Changing this forces a new resource to be created.

### firewall_rule_name
Specifies the name of the MySQL Firewall Rule. Changing this forces a new resource to be created.

### db_name
Specifies the name of the MySQL Database, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created.

### charset
Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created.

### collation
Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created.

### create_lock
Whether to lock the resource group or not. true enables the lock, false does not lock the resource group.

### resource_lock_name
Specifies the name of the Management Lock. Changing this forces a new resource to be created.

### lock_level
Specifies the Level to be used for this Lock. Possible values are CanNotDelete and ReadOnly. Changing this forces a new resource to be created.

### notes
Specifies some notes about the lock. Maximum of 512 characters. Changing this forces a new resource to be created.

## Outputs

### fqdn
The Fully Qualified Domain Name of the MySQL on Azure database server.

### db_server_name
The name of the MySQL Server.

### db_name
The name of the database.

### admin_username
The administrator login name of the MySQL Server.