variable "admin_state" {
  description = "An SNMP Community String.  The community can be between 0 and 32 characters."
  type        = string
  default     = "enabled"
  validation {
    condition = (
      can(regexall("^(enabled|disabled)$", var.admin_state))
    )
    error_message = "The Admin State for the SNMP default Policy can be enabled or disabled."
  }
}

variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "A Description for the SNMP Policy default."
  type        = string
  default     = ""
  validation {
    condition = (
      length(var.description) >= 0 &&
      length(var.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.description))
    )
    error_message = "The Description can be between 0 ad 128 characters."
  }
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "snmp_contact" {
  description = "A Contact for the SNMP Policy default."
  type        = string
  default     = "admins@example.com"
  validation {
    condition = (
      length(var.snmp_contact) >= 0 &&
      length(var.snmp_contact) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.snmp_contact))
    )
    error_message = "The SNMP Default Contact can be between 0 ad 128 characters."
  }
}

variable "snmp_location" {
  description = "A Location for the SNMP Policy default."
  type        = string
  default     = "Data Center"
  validation {
    condition = (
      length(var.snmp_location) >= 0 &&
      length(var.snmp_location) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.snmp_location))
    )
    error_message = "The SNMP Default Location can be between 0 ad 128 characters."
  }
}
