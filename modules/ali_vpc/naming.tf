locals {
  naming = {
    alicloud_vswitch = {
        nat = "nat"
        utility = "utility"
    }
  }

  old_naming = {
    alicloud_vpc = var.name
    alicloud_vswitch = {
        nat = "nat-$(var.name)"
        utility = "utility-$(var.name)"
    }
    alicloud_nat_gateway = var.name
    aliclout_eip = "nat-$(var.name)"
    alicloud_log_project = "vpc-log-$(var.name)"
    alicloud_vpc_flow_log = "vpc-log-$(var.name)"
    alicloud_network_acl = "nacl-$(var.name)"

  }
}

module "naming_alicloud_vpc" {
    count = var.new_naming_convention ? 1:0
    source = "../ali_naming_convention"
    alicloud_resource_type = "alicloud_vpc"
    apm_id = var.apm_id
    region = var.region
    environment_class = var.environment_class
    environment_group = var.environment_group
    logical_environment = var.logical_environment
    name_prefix = var.name_prefix

    depends_on = [ null_resource.naming_parameter_validation ]
}

module "naming_alicloud_vswitch"{
    for_each = var.new_naming_convention ? toset(values(local.naming.alicloud_vswitch)) : []
    source = "../ali_naming_convention"
    alicloud_resource_type = "alicloud_vswitch"
    apm_id = var.apm_id
    region = var.region
    environment_class = var.environment_class
    environment_group = var.environment_group
    logical_environment = var.logical_environment
    name_prefix = var.name_prefix

    depends_on = [ null_resource.naming_parameter_validation ]
}

# module "naming_alicloud_nat_gateway"{
#     count = var.new_naming_convention ? 1: 0
#     source = "../ali_naming_convention"
#     alicloud_resource_type = "alicloud_nat_gateway"
# }