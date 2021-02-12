terraform {
  experiments = [module_variable_optional_attrs]
}

variable "communities" {
  description = "Add SNMP Commities to the Fabric default Policy."
  type = object({
    # comm_descr: SNMP Community Description
    description = optional(string)
    # community: SNMP Community value
    community = string
  })
  validation {
    condition = (
      length(var.communities.description) >= 0 &&
      length(var.communities.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.communities.description))
    )
    error_message = "The Description can only be between 0 ad 128 characters."
  }
  validation {
    condition = (
      length(var.communities.community) >= 1 &&
      length(var.communities.community) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.communities.community))
    )
    error_message = "The Community is a Required Parameter and must be between 1 and 32 characters."
  }
}

locals {
  default_communities = {
    community = "walk-this-way"
  }
  merged_communities = merge(local.default_communities, var.communities)
}