resource "azurerm_storage_table" "this" {
  for_each = { for table in var.tables : table.name => table }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name

  dynamic "acl" {
    for_each = { for acl in each.value.acl : acl.id => acl }
    content {
      id = acl.value.id
      access_policy {
        permissions = acl.value.permission
        start       = acl.value.start
        expiry      = acl.value.expiry
      }
    }
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_storage_table"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_storage_table"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_storage_table"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_storage_table"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}