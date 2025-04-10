/*
 * # wanted-cloud/terraform-azure-storage-account
 * 
 * Terraform building block module managing Azure Storage account and its resources.
 */

resource "azurerm_storage_account" "this" {
  name                              = var.name
  resource_group_name               = data.azurerm_resource_group.this.name
  location                          = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  account_tier                      = var.account_tier
  account_replication_type          = var.account_replication_type
  account_kind                      = var.account_kind
  https_traffic_only_enabled        = var.https_traffic_only_enabled
  min_tls_version                   = var.min_tls_version
  edge_zone                         = var.edge_zone
  cross_tenant_replication_enabled  = var.cross_tenant_replication_enabled
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  shared_access_key_enabled         = var.shared_access_key_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  default_to_oauth_authentication   = var.default_to_oauth_authentication
  is_hns_enabled                    = var.is_hns_enabled
  nfsv3_enabled                     = var.nfsv3_enabled
  large_file_share_enabled          = var.large_file_share_enabled
  local_user_enabled                = var.local_user_enabled
  queue_encryption_key_type         = var.queue_encryption_key_type
  table_encryption_key_type         = var.table_encryption_key_type
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  allowed_copy_scope                = var.allowed_copy_scope
  sftp_enabled                      = var.sftp_enabled
  dns_endpoint_type                 = var.dns_endpoint_type

  tags = merge(local.metadata.tags, var.tags)
}