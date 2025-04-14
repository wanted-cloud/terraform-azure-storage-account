module "example" {
    source = "../.."

    name = "example"
    resource_group_name = "test"

    queues = [{
      name = "example-queue"
    }]
}