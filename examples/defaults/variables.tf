variable "community1" {
  type      = string
  sensitive = true
}

variable "snmp_user1" {
  type      = string
  sensitive = true
}

variable "auth_key1" {
  type      = string
  sensitive = true
}

variable "aciUser" {
  description = "If using a Domain with the User Remember to add apic#[domain]\\<username>"
  type        = string
}

variable "aciPass" {
  type = string
}

variable "aciUrl" {
  description = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type        = string
  default     = "{{APIC_URL}}"
}