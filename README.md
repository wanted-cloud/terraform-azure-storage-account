<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-storage-account

Terraform building block module managing Azure Storage account and its resources.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.11)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (=4.05.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (=4.05.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name of the Azure storage account.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: Name of the resource group in which the Azure storage accountwill be created.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind)

Description: The kind of storage account to create. Possible values are: Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage, and StorageImportExport.

Type: `string`

Default: `"StorageV2"`

### <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type)

Description: The replication type of the storage account. Possible values are: LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS, LRS-RA, LRS-ZRS, LRS-GZRS, LRS-RA-GZRS.

Type: `string`

Default: `"LRS"`

### <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier)

Description: The performance tier of the storage account. Possible values are: Standard and Premium.

Type: `string`

Default: `"Standard"`

### <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public)

Description: Allow nested items to be public for the storage account.

Type: `bool`

Default: `true`

### <a name="input_allowed_copy_scope"></a> [allowed\_copy\_scope](#input\_allowed\_copy\_scope)

Description: The allowed copy scope for the storage account.

Type: `string`

Default: `""`

### <a name="input_blob_containers"></a> [blob\_containers](#input\_blob\_containers)

Description: Blob containers to be created in the storage account.

Type:

```hcl
list(object({
    name                              = string
    metadata                          = optional(map(string), {})
    access_type                       = optional(string, "private")
    default_encryption_scope          = optional(string, "")
    encryption_scope_override_enabled = optional(bool, null)
  }))
```

Default: `[]`

### <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled)

Description: Enable cross-tenant replication for the storage account.

Type: `bool`

Default: `false`

### <a name="input_default_to_oauth_authentication"></a> [default\_to\_oauth\_authentication](#input\_default\_to\_oauth\_authentication)

Description: Value of the default\_to\_oauth\_authentication property for the storage account.

Type: `bool`

Default: `false`

### <a name="input_dns_endpoint_type"></a> [dns\_endpoint\_type](#input\_dns\_endpoint\_type)

Description: The DNS endpoint type for the storage account. Possible values are: Standard and AzureDnsZone.

Type: `string`

Default: `"Standard"`

### <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone)

Description: Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created.

Type: `string`

Default: `null`

### <a name="input_file_shares"></a> [file\_shares](#input\_file\_shares)

Description: File shares to be created in the storage account.

Type:

```hcl
list(object({
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
```

Default: `[]`

### <a name="input_file_syncs"></a> [file\_syncs](#input\_file\_syncs)

Description: Storage Fike Syncs to be created in the storage account.

Type:

```hcl
list(object({
    name                    = string
    resource_group_name     = optional(string, "")
    location                = optional(string, "")
    incoming_traffic_policy = optional(string, "AllowAllTraffic")
    tags                    = optional(map(string), {})
  }))
```

Default: `[]`

### <a name="input_https_traffic_only_enabled"></a> [https\_traffic\_only\_enabled](#input\_https\_traffic\_only\_enabled)

Description: Enable HTTPS traffic only for the storage account.

Type: `bool`

Default: `true`

### <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled)

Description: Enable infrastructure encryption for the storage account.

Type: `bool`

Default: `false`

### <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled)

Description: Enable hierarchical namespace for the storage account.

Type: `bool`

Default: `false`

### <a name="input_large_file_share_enabled"></a> [large\_file\_share\_enabled](#input\_large\_file\_share\_enabled)

Description: Enable large file share for the storage account.

Type: `bool`

Default: `false`

### <a name="input_local_user_enabled"></a> [local\_user\_enabled](#input\_local\_user\_enabled)

Description: Enable local user for the storage account.

Type: `bool`

Default: `true`

### <a name="input_location"></a> [location](#input\_location)

Description: Location of the resource group in which the Azure storage account will be created, if not set it will be the same as the resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version)

Description: Minimum TLS version for the storage account. Possible values are: TLS1\_0, TLS1\_1, and TLS1\_2.

Type: `string`

Default: `"TLS1_2"`

### <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled)

Description: Enable NFSv3 for the storage account.

Type: `bool`

Default: `false`

### <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled)

Description: Enable public network access for the storage account.

Type: `bool`

Default: `true`

### <a name="input_queue_encryption_key_type"></a> [queue\_encryption\_key\_type](#input\_queue\_encryption\_key\_type)

Description: The type of encryption key to use for the queue service. Possible values are: Account, Service, and Customer.

Type: `string`

Default: `"Service"`

### <a name="input_queues"></a> [queues](#input\_queues)

Description: Queue type storages to be created in the storage account.

Type:

```hcl
list(object({
    name     = string
    metadata = optional(map(string), {})
  }))
```

Default: `[]`

### <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled)

Description: Enable SFTP for the storage account.

Type: `bool`

Default: `false`

### <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled)

Description: Enable shared access key for the storage account.

Type: `bool`

Default: `true`

### <a name="input_static_website"></a> [static\_website](#input\_static\_website)

Description: Static website configuration for the storage account.

Type:

```hcl
object({
    enabled            = bool
    index_document     = optional(string, "index.html")
    error_404_document = optional(string, "404.html")
  })
```

Default:

```json
{
  "enabled": false
}
```

### <a name="input_table_encryption_key_type"></a> [table\_encryption\_key\_type](#input\_table\_encryption\_key\_type)

Description: The type of encryption key to use for the table service. Possible values are: Account, Service, and Customer.

Type: `string`

Default: `"Service"`

### <a name="input_tables"></a> [tables](#input\_tables)

Description: Table type storages to be created in the storage account.

Type:

```hcl
list(object({
    name = string
    acls = optional(list(object({
      id         = string
      permission = string
      start      = string
      expiry     = string
    })), [])
  }))
```

Default: `[]`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags to be applied to the Azure storage account.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_blob_containers"></a> [blob\_containers](#output\_blob\_containers)

Description: The blob containers created in the storage account.

### <a name="output_file_shares"></a> [file\_shares](#output\_file\_shares)

Description: The file shares created in the storage account.

### <a name="output_queues"></a> [queues](#output\_queues)

Description: The queues created in the storage account.

### <a name="output_static_website"></a> [static\_website](#output\_static\_website)

Description: The static website configuration for the storage account.

### <a name="output_storage_account"></a> [storage\_account](#output\_storage\_account)

Description: The storage account object.

### <a name="output_tables"></a> [tables](#output\_tables)

Description: The tables created in the storage account.

## Resources

The following resources are used by this module:

- [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_account) (resource)
- [azurerm_storage_account_static_website.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_account_static_website) (resource)
- [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_container) (resource)
- [azurerm_storage_queue.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_queue) (resource)
- [azurerm_storage_share.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_share) (resource)
- [azurerm_storage_sync.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_sync) (resource)
- [azurerm_storage_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/resources/storage_table) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.05.0/docs/data-sources/resource_group) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/storage-account/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "template" {
    source = "../.."

    name = "example"
    resource_group_name = "test"
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->