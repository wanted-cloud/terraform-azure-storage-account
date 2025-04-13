resource "azurerm_storage_sync" "this" {
  for_each = { for sync in var.file_syncs : sync.name => sync }

  name                = each.value.name
  resource_group_name = each.value.resource_group_name != "" ? each.value.resource_group_name : data.azurerm_resource_group.this.name
  location            = each.value.location != "" ? each.value.location : data.azurerm_resource_group.this.location

  tags = merge(local.metadata.tags, each.value.tags)

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_storage_sync"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_storage_sync"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_storage_sync"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_storage_sync"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}