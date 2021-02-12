terraform {
  experiments = [module_variable_optional_attrs]
}

variable "communities" {
  description = "Add SNMP Commities to the Fabric default Policy"
  type = object({
    # comm_descr: SNMP Community Description
    comm_descr = optional(string)
    # community: SNMP Community value
    community = string
  })
  default = [
    {
      community = "walk-this-way"
    }
  ]
  validation {
    condition = (
      length(var.comm_descr) >= 0 &&
      length(var.comm_descr) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.comm_descr))
    )
    error_message = "The Community Description can only be between 0 ad 128 characters"
  }
  validation {
    condition = (
      length(var.community) >= 1 &&
      length(var.community) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.community))
    )
    error_message = "The Community is a Required Parameter and must be between 1 and 32 characters"
  }
}