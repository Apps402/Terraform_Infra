resource "azurerm_mssql_server" "sql" {
  for_each = var.sql
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.username
  administrator_login_password = each.value.password
  minimum_tls_version          = "1.2"

 
}



resource "azurerm_mssql_database" "sqldb" {
  for_each = var.sql
  name                = each.value.sqldb_name
  server_id         = azurerm_mssql_server.sql[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = "2"
  sku_name     = "S0"
  enclave_type = "VBS"
}