terraform {
  experiments = [module_variable_optional_attrs]
}

variable "isis_policy" {
  type = map(object({
    mtu                   = optional(number)
    metric                = optional(number)
    lsp_fast_flood        = optional(string)
    lsp_initial_interval  = optional(number)
    lsp_max_interval      = optional(number)
    lsp_second_interval   = optional(number)
    spf_initial_interval  = optional(number)
    spf_max_interval      = optional(number)
    spf_second_interval   = optional(number)
  }))
  default = {
    default = {
      mtu                   = 1492
      metric                = 63
      lsp_fast_flood        = "enabled"
      lsp_initial_interval  = 50
      lsp_max_interval      = 8000
      lsp_second_interval   = 50
      spf_initial_interval  = 50
      spf_max_interval      = 8000
      spf_second_interval   = 50
    }
  }
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

locals {
  isis_policy = {
    for k, v in var.isis_policy : k => {
      mtu                   = coalesce(v.mtu, 1492)
      metric                = coalesce(v.metric, 63)
      lsp_fast_flood        = coalesce(v.lsp_fast_flood, "enabled")
      lsp_initial_interval  = coalesce(v.lsp_initial_interval, 50)
      lsp_max_interval      = coalesce(v.lsp_max_interval, 8000)
      lsp_second_interval   = coalesce(v.lsp_second_interval, 50)
      spf_initial_interval  = coalesce(v.spf_initial_interval, 50)
      spf_max_interval      = coalesce(v.spf_max_interval, 8000)
      spf_second_interval   = coalesce(v.spf_second_interval, 50)
    }
  }

}
