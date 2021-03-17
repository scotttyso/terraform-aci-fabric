variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "client_group_dn" {
  description = "SNMP Client Group Name"
  type        = string
}

variable "name" {
  description = "Descriptive Name for the SNMP Client"
  type        = string
  default     = "server1"
}

variable "client" {
  description = "IPv4 or IPv6 Address of the SNMP Client"
  type        = string
  default     = "198.18.1.1"
  validation {
    condition     = (can(regexall("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$|[a-fA-F0-9:]+$)", var.client)))
    error_message = "The SNMP Client must be a valid IPv4 or IPv6 Address."
  }
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}
