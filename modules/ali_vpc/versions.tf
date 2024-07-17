terraform{
    required_version = ">= 1.5.0"
    required_providers {
      alicloud = {
        source = "aliyun/alicloud"
        # version = ">= 1.214.1"
        version = "~> 1.188.0"
      }
    }
}