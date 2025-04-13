resource "azurerm_storage_share" "this" {
  for_each = { for share in var.file_shares : share.name => share }

  name               = each.value.name
  storage_account_id = azurerm_storage_account.this.id
  quota              = each.value.quota
  access_tier        = each.value.access_tier
  metadata           = each.value.metadata
  enabled_protocol   = each.value.enabled_protocol

  dynamic "acl" {
    for_each = { for acl in each.value.acls : acl.id => acl }
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
      local.metadata.resource_timeouts["azurerm_storage_share"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_storage_share"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_storage_share"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_storage_share"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}