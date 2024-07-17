variable "network" {
    type = string
    description = "The CIDR block for the VPC"
  
}

variable "name" {
    type = string
    default = ""
    description = "Name for VPC, NAT gateway and subnets"
}

variable "vpc_desciption" {
  type = string
  default = ""
  description = "VPC description (information parameter)"
}

variable "resource_group_id" {
    type = string
    default = ""
    description = "Resource group ID"
}

variable "cen" {
  type = object({
    enabled = bool
    instance_id = string
  })
  default = {
    enabled = false
    instance_id = ""
  }
  description = "cen instance associate with the VPC"
}

variable "cross_account_cen" {
  type = object ({
    enabled = false
    instance_id = string
    cen_owner_account_id = string
  })
  default = {
    enabled = false
    instance_id = ""
    cen_owner_account_id = ""
  }
  description = "cross account cen instance associate with the VPC"
}

variable "eip_bandwidth" {
  type = string
  description = "Maximum bandwidth to the eip, measured in Mbps"
  default = "5"
}

variable "eip_internet_charge_type" {
  type = string
  description = "Internet charge Type of the eip, valid values are PayByBandwidth, PayByTraffic"
  default = "PayByTraffic"
}

variable "eip_subscription_period" {
  type = number
  description = "The duration that you will buy the resource, in month, it is valid when instance_charge_type is Prepaid, default to 1, valid values: [1-9,12,24,36]"
  default = 1
}

variable "eip_instance_charge_type" {
  type = string
  description = "The billing month of the EIP. Valid values: Subscription and PayAsYouGo, default value is PayAsYouGo"
  default = "PayAsYouGo"
}

variable "utility_vswitch" {
  type = object({
    enabled = bool
    subnet = string
    zone = string 
  })
  default = {
    enabled = false
    subnet = ""
    zone = ""
  }
  description = "Configuration for utility subnet"
}

variable "nat_enabled" {
  type = bool
  description = "Enable NAT and all connected resources"
  default = true
}

variable "nat_vswitch" {
  type = object({
    subnet = string
    zone = string
  })
  description = "Configuration for NAT subnet"
}

variable "nat_type" {
  type = string
  description = "valid value: Normal, Enhanced, Normal version is being decomissioned (all gateway are being upgraded to Enhanced)"
  default = "Enhanced"

  validation {
    condition = contains("Normal", "Enhanced", var.nat_type)
    error_message = "Valid nat_type values: Normal, Enahanced"
  }
}

variable "vpc_timeouts" {
  type = map(string)
  default = {
    "name" = "value"
  }
  description = "VPC operation timeouts. Example: {create = \"20m\"}"
}

variable "flow_log" {
  type = object({
    enabled = bool
    traffic_type = string
    retention_period = number 
  })
  default = {
    enabled = false
    traffic_type = ""
    retention_period = 30
  }
  description = "Create a VPC Flow log for the VPC"
}

variable "tags" {
  description = "Tags"
  type = object({
    APMID = string
    EnvironmentClass = string
    EnvironmentGroup = string
    ResourceGroup = string

    DataPII = optional(bool)
    Owner = optional(string)
    Component = optional(string)
    Name = optional(string)
    ExpirationDate = optional(string)

    pipelineTags = optional(map(string))
    ExtraTags = optional(map(string))
  })
}

variable "new_naming_convention"{
    type = bool
    default = true
    description = "Enable the naming convention"
}

variable "apm_id" {
  type = string
  default = ""
  description = "APM ID"
}

variable "region" {
  type = string
  default = ""
  description = "Ali Cloud region"
}

variable "environment_class" {
  type = string
  default = ""
  description = "Environment Class"
}

variable "environment_group" {
  type = string
  default = ""
  description = "Environment group"
}

variable "logical_environment" {
  type = string
  default = ""
  description = "Logical Environment Name"
}

variable "name_prefix" {
  type = string
  default = ""
  description = "Resource name prefix"
}

variable "internet_charge_type" {
  type = string
  default = ""
  description = "The internet charge type, valid values: PayByLcu, PayBySpec, the PayByLcu only support enhanced NAT, NOTE!! from 1.137.0+ PayBySpec has been deprecated"
}

variable "assume_role_arn" {
  type = string
  default = ""
  description = "RAM role ARN to be assumed by aliyun CLI"
}