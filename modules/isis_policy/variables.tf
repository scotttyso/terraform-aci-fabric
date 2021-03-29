variable "mtu" {
  description = "The IS-IS Domain policy LSP MTU. The MTU is from 128 to 4352. The default is 1492."
  type        = number
  default     = 1492
  validation {
    condition = (
      var.mtu >= 128 &&
      var.mtu <= 4352
    )
    error_message = "ISIS MTU must be between 128 and 4352."
  }
}

variable "metric" {
  description = "The IS-IS metric that is used for all imported routes into IS-IS. The values available are from 1 to 63. The default value is 63."
  type        = number
  default     = 63
  validation {
    condition = (
      var.metric >= 1 &&
      var.metric <= 63
    )
    error_message = "ISIS Metric must be between 1 and 63."
  }
}

variable "lsp_fast_flood" {
  description = "The IS-IS Fast-Flooding of LSPs improves Intermediate System-to-Intermediate System (IS-IS) convergence time when new link-state packets (LSPs) are generated in the network and shortest path first (SPF) is triggered by the new LSPs. The mode can be:\n\n * enabled\n * disabled\n\nThe default is enabled."
  type        = string
  default     = "enabled"
  validation {
    condition     = can(regexall("^(enabled|disabled)$", var.lsp_fast_flood))
    error_message = "ISIS Fast Flood options are enabled or disabled."
  }
}

variable "lsp_initial_interval" {
  description = "The LSP generation initial wait interval. This is used in the LSP generation interval for the LSP MTU. The default is 50."
  type        = number
  default     = 50
  validation {
    condition = (
      var.lsp_initial_interval >= 50 &&
      var.lsp_initial_interval <= 120000
    )
    error_message = "ISIS LSP Initial Interval must be between 50 and 120000."
  }
}

variable "lsp_max_interval" {
  description = "The LSP generation maximum wait interval. This is used in the LSP generation interval for the LSP MTU. The default is 8000."
  type        = number
  default     = 50
  validation {
    condition = (
      var.lsp_max_interval >= 50 &&
      var.lsp_max_interval <= 120000
    )
    error_message = "ISIS LSP Max Interval must be between 50 and 120000."
  }
}

variable "lsp_second_interval" {
  description = "The LSP generation second wait interval. This is used in the LSP generation interval for the LSP MTU. The default is 50."
  type        = number
  default     = 8000
  validation {
    condition = (
      var.lsp_second_interval >= 50 &&
      var.lsp_second_interval <= 120000
    )
    error_message = "ISIS LSP Second Interval must be between 50 and 120000."
  }
}

variable "spf_initial_interval" {
  description = "The SPF computation frequency initial wait interval. This is used in the SPF computations for the LSP MTU. The default is 50."
  type        = number
  default     = 50
  validation {
    condition = (
      var.spf_initial_interval >= 50 &&
      var.spf_initial_interval <= 120000
    )
    error_message = "ISIS SPF Initial Interval must be between 50 and 120000."
  }
}

variable "spf_max_interval" {
  description = "The SPF computation frequency maximum wait interval. This is used in the SPF computations for the LSP MTU. The default is 8000."
  type        = number
  default     = 8000
  validation {
    condition = (
      var.spf_max_interval >= 50 &&
      var.spf_max_interval <= 120000
    )
    error_message = "ISIS SPF Max Interval must be between 50 and 120000."
  }
}

variable "spf_second_interval" {
  description = "The SPF computation frequency second wait interval. This is used in the SPF computations for the LSP MTU. The default is 50."
  type        = number
  default     = 50
  validation {
    condition = (
      var.spf_second_interval >= 50 &&
      var.spf_second_interval <= 120000
    )
    error_message = "ISIS SPF Second Interval must be between 50 and 120000."
  }
}
