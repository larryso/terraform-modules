variable "module_tags" {
  description = "Module default tags"
  type = object({
    TFModulesVersion = string
    TFComponent = string
  })
  default = {
    TFModulesVersion = null 
    TFComponent = null 
  }
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

  validation {
    condition = contains(keys(var.tags), "APMID") && try(length(var.tags.APMID) >=3 && var.tags.APMID == upper(var.tags.APMID), false)
    error_message = "APMID must be capital string of 3 characters at least"
  }
}