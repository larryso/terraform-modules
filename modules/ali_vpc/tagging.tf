locals{
    default_tags = {
        "TFModulesVersion" = local.modules_version
        "TFComponent" = "ali_vpc"
    }
}
module "ali_tags"{
    source = "../ali_tags"

    tags = var.tags
    module_tags = local.default_tags
}