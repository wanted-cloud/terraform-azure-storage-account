resource "azurerm_storage_account_static_website" "this" {
  for_each           = var.static_website.enabled ? [1] : []
  storage_account_id = azurerm_storage_account.this.id
  error_404_document = var.static_website.error_404_document
  index_document     = var.static_website.index_document
}