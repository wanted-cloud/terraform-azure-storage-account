resource "azurerm_storage_queue" "this" {
  for_each = { for queue in var.queues : queue.name => queue }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
  metadata             = each.value.metadata

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_storage_queue"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_storage_queue"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_storage_queue"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_storage_queue"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}