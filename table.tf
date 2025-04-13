resource "azurerm_storage_table" "this" {
  for_each = { for table in var.tables : table.name => table }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
}