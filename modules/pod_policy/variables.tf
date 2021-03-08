variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "bgp_policy" {
  type        = string
  description = "BGP Route Reflector Policy Name"
  default     = "default"
}

variable "coop_policy" {
  type        = string
  description = "COOP Group Policy Name"
  default     = "default"
}

variable "date_time" {
  type        = string
  description = "Date and Time Policy Name"
  default     = "default"
}

variable "description" {
  type        = string
  description = "Description for the Pod Policy Group"
  default     = "Default Policy Created by the terraform-aci provider"
}

variable "isis_policy" {
  type        = string
  description = "ISIS Policy Name"
  default     = "default"
}

variable "macsec_policy" {
  type        = string
  description = "MACsec Policy Name"
  default     = "default"
}

variable "mgmt_policy" {
  type        = string
  description = "Management Access Policy Name"
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "pod_pgrp" {
  type        = string
  description = "Pod Policy Group Name.  This will be used to assign the following policies to the switches."
  default     = "default"
}

variable "snmp_policy" {
  type        = string
  description = "SNMP Policy Name"
  default     = "default"
}
