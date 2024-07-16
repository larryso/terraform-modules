variable "alicloud_resource_type" {
  type = string
  description = "Alicloud Resource Type"
}

variable "apm_id" {
  type = string
  default = ""
  description = "APMID"
}

variable "region" {
  type = string
  default = ""
  description = "Alicloud Region"
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
  description = "Logical environment name"
}

variable "name_prefix" {
  type = string
  default = ""
  description = "Resource name prefix"
}