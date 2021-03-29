variable "mtu" {
  type  = number
}

variable "metric" {
  type  = number
}

variable "lsp_fast_flood" {
  type  = string
}

variable "lsp_initial_interval" {
  type  = number
}

variable "lsp_max_interval" {
  type  = number
}

variable "lsp_second_interval" {
  type  = number
}

variable "spf_initial_interval" {
  type  = number
}

variable "spf_max_interval" {
  type  = number
}

variable "spf_second_interval" {
  type  = number
}



variable "aciUser" {
  description = "If using a Domain with the User Remember to add apic#[domain]\\<username>"
  type        = string
}


variable "aciPass" {
  description = "NEVER Store your USERNAME or PASSWORD in a Public Repository"
  type        = string
}

variable "aciUrl" {
  description = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type        = string
  default     = "https://brahma-apic1.rich.ciscolabs.com"
}
