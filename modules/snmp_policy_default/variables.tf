variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "community" {
  description = "An SNMP Community String.  The community can be between 0 and 32 characters."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.community) >= 1 &&
      length(var.community) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.community))
    )
    error_message = "The Community is a Required Parameter and must be between 1 and 32 characters.  This is a Sensitive Parameter."
  }
}

variable "description" {
  description = "SNMP Community Description."
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
