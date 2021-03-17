variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "SNMP Destination Group Description."
  type        = string
  default     = ""
  validation {
    condition = (
      length(var.description) >= 0 &&
      length(var.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.description))
    )
    error_message = "The SNMP Destination Group Description can be between 0 ad 128 characters."
  }
}

variable "dest_group_name" {
  description = "Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group"
  type        = string
  default     = "default_oob"
}

# output "dest_group" {
#   value = aci_rest.snmp_trap_destination_group.id
# }

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}
