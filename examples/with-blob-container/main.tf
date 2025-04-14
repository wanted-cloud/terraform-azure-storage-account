module "template" {
    source = "../.."

    name = "example"
    resource_group_name = "test"

    blob_containers = [{
      name = "example-blob-container"
    }]
}