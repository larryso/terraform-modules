locals {
  region_abbreviation = var.region == "" ? "" : module.region_abbreviation[0].region_abbreviation
  envirronment_name_components = compact([var.environment_class, var.environment_group, var.logical_environment])

  resource_name = {
    alicloud_vpc = join("-", compact(concat([var.apm_id, local.region_abbreviation], local.envirronment_name_components, [var.name.prefix, "vpc"])))
    alicloud_vswitch = join("-", compact(concat([var.apm_id, local.region_abbreviation], local.envirronment_name_components, [var.name.prefix, "vsw"])))
  }
}

module "region_abbreviation"{
    count = var.region == "" ? 0 : 1
    source = "../ali_region_abbreviation"
    region = var.region
}