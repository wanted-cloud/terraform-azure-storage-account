output "storage_account" {
  value       = azurerm_storage_account.this
  description = "The storage account object."
}

output "blob_containers" {
  value       = azurerm_storage_container.this
  description = "The blob containers created in the storage account."
}

output "file_shares" {
  value       = azurerm_storage_share.this
  description = "The file shares created in the storage account."
}

output "queues" {
  value       = azurerm_storage_queue.this
  description = "The queues created in the storage account."
}

output "tables" {
  value       = azurerm_storage_table.this
  description = "The tables created in the storage account."
}

output "static_website" {
  value       = azurerm_storage_account_static_website.this
  description = "The static website configuration for the storage account."
}
