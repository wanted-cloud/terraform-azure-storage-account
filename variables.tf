variable "name" {
  description = "Name of the Azure storage account."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which the Azure storage accountwill be created."
  type        = string
}

variable "location" {
  description = "Location of the resource group in which the Azure storage account will be created, if not set it will be the same as the resource group."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to be applied to the Azure storage account."
  type        = map(string)
  default     = {}
}

variable "account_kind" {
  description = "The kind of storage account to create. Possible values are: Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage, and StorageImportExport."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "The performance tier of the storage account. Possible values are: Standard and Premium."
  type        = string
  default     = "Standard"

}

variable "account_replication_type" {
  description = "The replication type of the storage account. Possible values are: LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS, LRS-RA, LRS-ZRS, LRS-GZRS, LRS-RA-GZRS."
  type        = string
  default     = "LRS"
}

variable "cross_tenant_replication_enabled" {
  description = "Enable cross-tenant replication for the storage account."
  type        = bool
  default     = false

}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created."
  type        = string
  default     = null
}

variable "https_traffic_only_enabled" {
  description = "Enable HTTPS traffic only for the storage account."
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Minimum TLS version for the storage account. Possible values are: TLS1_0, TLS1_1, and TLS1_2."
  type        = string
  default     = "TLS1_2"

}

variable "allow_nested_items_to_be_public" {
  description = "Allow nested items to be public for the storage account."
  type        = bool
  default     = true
}

variable "shared_access_key_enabled" {
  description = "Enable shared access key for the storage account."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Enable public network access for the storage account."
  type        = bool
  default     = true

}

variable "default_to_oauth_authentication" {
  description = "Value of the default_to_oauth_authentication property for the storage account."
  type        = bool
  default     = false
}

variable "is_hns_enabled" {
  description = "Enable hierarchical namespace for the storage account."
  type        = bool
  default     = false
}

variable "nfsv3_enabled" {
  description = "Enable NFSv3 for the storage account."
  type        = bool
  default     = false
}

variable "large_file_share_enabled" {
  description = "Enable large file share for the storage account."
  type        = bool
  default     = false

}

variable "local_user_enabled" {
  description = "Enable local user for the storage account."
  type        = bool
  default     = true

}

variable "queue_encryption_key_type" {
  description = "The type of encryption key to use for the queue service. Possible values are: Account, Service, and Customer."
  type        = string
  default     = "Service"
}

variable "table_encryption_key_type" {
  description = "The type of encryption key to use for the table service. Possible values are: Account, Service, and Customer."
  type        = string
  default     = "Service"

}

variable "infrastructure_encryption_enabled" {
  description = "Enable infrastructure encryption for the storage account."
  type        = bool
  default     = false

}

variable "allowed_copy_scope" {
  description = "The allowed copy scope for the storage account."
  type        = string
  default     = ""

}

variable "sftp_enabled" {
  description = "Enable SFTP for the storage account."
  type        = bool
  default     = false

}

variable "dns_endpoint_type" {
  description = "The DNS endpoint type for the storage account. Possible values are: Standard and AzureDnsZone."
  type        = string
  default     = "Standard"

}

variable "tables" {
  description = "Table type storages to be created in the storage account."
  type = list(object({
    name = string
    acls = optional(list(object({
      id         = string
      permission = string
      start      = string
      expiry     = string
    })), [])
  }))
  default = []
}

variable "queues" {
  description = "Queue type storages to be created in the storage account."
  type = list(object({
    name     = string
    metadata = optional(map(string), {})
  }))
  default = []
}

variable "file_syncs" {
  description = "Storage Fike Syncs to be created in the storage account."
  type = list(object({
    name                    = string
    resource_group_name     = optional(string, "")
    location                = optional(string, "")
    incoming_traffic_policy = optional(string, "AllowAllTraffic")
    tags                    = optional(map(string), {})
  }))
  default = []
}

variable "file_shares" {
  description = "File shares to be created in the storage account."
  type = list(object({
    name             = string
    quota            = optional(number, 50)
    metadata         = optional(map(string), {})
    access_tier      = optional(string, "Hot")
    enabled_protocol = optional(string, "SMB")
    acls = optional(list(object({
      permission = string
      start      = string
      expiry     = string
    })), [])
  }))
  default = []

}

variable "blob_containers" {
  description = "Blob containers to be created in the storage account."
  type = list(object({
    name                              = string
    metadata                          = optional(map(string), {})
    access_type                       = optional(string, "private")
    default_encryption_scope          = optional(string, "")
    encryption_scope_override_enabled = optional(bool, null)
  }))
  default = []
}

variable "static_website" {
  description = "Static website configuration for the storage account."
  type = object({
    enabled            = bool
    index_document     = optional(string, "index.html")
    error_404_document = optional(string, "404.html")
  })
  default = {
    enabled = false
  }
}