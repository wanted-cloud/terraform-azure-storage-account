module "template" {
    source = "../.."

    name = "example"
    resource_group_name = "test"

    tables = [{
      name = "example"
      acls = [{
        id         = "example-acl-id"
        permission = "rw"
        start      = "2023-01-01T00:00:00Z"
        expiry     = "2024-01-01T00:00:00Z"
      }]
    }]
}