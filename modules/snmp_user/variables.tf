variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "auth_key" {
  description = "Authentication Key.  A string between 8 and 32 Characters.  This is a Sensitive Parameter."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.auth_key) >= 8 &&
      length(var.auth_key) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.auth_key))
    )
    error_message = "The Authentication Key must be between 8 and 32 characters."
  }
}

variable "auth_type" {
  description = "Authentication Type.  Options are [hmac-sha1-96|None|hmac-md5-96]\n - For ACI 4.x and below with md5 leave Blank.\n - For ACI 5.x do 'hmac-md5-96', which is the default option for md5 based authentication."
  type        = string
  default     = "hmac-md5-96"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "priv_key" {
  description = "Privacy Key.  A string between 8 and 32 Characters.  Optional if not doing Privacy Authentication.  This is a Sensitive Parameter."
  type        = string
  sensitive   = true
  default     = ""
}

variable "priv_type" {
  description = "Options are (des|None|aes-128)\n - For None leave Blank with ACI 4.x.  With ACI 5.x do des which is the default."
  type        = string
  default     = "des"
}

variable "snmp_user" {
  description = "SNMP User Name."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.snmp_user) >= 1 &&
      length(var.snmp_user) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.snmp_user))
    )
    error_message = "The SNMP User is a Required Parameter and must be between 1 and 32 characters."
  }
}
