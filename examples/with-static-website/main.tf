module "template" {
    source = "../.."

    name = "example"
    resource_group_name = "test"

    static_website = {
        enabled = true
        index_document = "index.html"
        error_404_document = "error.html"
    }
}