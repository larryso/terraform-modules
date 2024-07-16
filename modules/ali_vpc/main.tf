resource "alicloud_vpc" "vpc" {
  cidr_block = var.network
  vpc_name = var.new_naming_convention ? module.naming_alicloud_vpc[0].resource_name : local.old_naming.alicloud_vpc
  description = var.vpc_desciption
  resource_group_id = var.resource_group_id

  tags = merge(
    module.ali_tags.tags,
    {
      "Name" = var.new_naming_convention? module.naming_alicloud_vpc[0].resource_name : local.old_naming.alicloud_vpc
    }
  )
}

# resource "alicloud_vswitch" "nat"{
  
# }