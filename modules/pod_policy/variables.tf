variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "bgp_policy" {
  description = "BGP Route Reflector Policy Name"
  type        = string
  default     = "default"
}

variable "coop_policy" {
  description = "COOP Group Policy Name"
  type        = string
  default     = "default"
}

variable "date_time" {
  description = "Date and Time Policy Name"
  type        = string
  default     = "default"
}

variable "description" {
  description = "Description for the Pod Policy Group"
  type        = string
  default     = "Default Policy Created by the terraform-aci provider"
}

variable "isis_policy" {
  description = "ISIS Policy Name"
  type        = string
  default     = "default"
}

variable "macsec_policy" {
  description = "MACsec Policy Name"
  type        = string
  default     = "default"
}

variable "mgmt_policy" {
  description = "Management Access Policy Name"
  type        = string
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "ppg_name" {
  description = "Pod Policy Group Name.  This will be used to assign the following policies to the switches."
  type        = string
  default     = "default"
}

variable "snmp_policy" {
  description = "SNMP Policy Name"
  type        = string
  default     = "default"
}
