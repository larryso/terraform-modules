locals {
  region_abbreviation = {
    "cn-qingdao" = "qgd",
    "cn-beijing" = "bjn",
    "cn-shanghai" = "shg",
    "cn-hangzhou" = "hgz"
  }

  region_ali_suffix = local.region_abbreviation[var.region]
}