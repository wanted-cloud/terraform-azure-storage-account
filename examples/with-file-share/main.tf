module "template" {
    source = "../.."

    name = "example"
    resource_group_name = "test"

    file_shares = [{
      name = "example-file-share"
      quota = 50
    }]
}