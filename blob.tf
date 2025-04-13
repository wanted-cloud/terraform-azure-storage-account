resource "azurerm_storage_container" "this" {
  for_each = { for container in var.blob_containers : container.name => container }

  name                              = each.value.name
  storage_account_id                = azurerm_storage_account.this.id
  container_access_type             = each.value.access_type
  metadata                          = each.value.metadata
  default_encryption_scope          = each.value.default_encryption_scope
  encryption_scope_override_enabled = each.value.encryption_scope_override_enabled

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_storage_container"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_storage_container"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_storage_container"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_storage_container"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}