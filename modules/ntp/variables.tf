variable "ntp" {
  description = "Deploy NTP Servers for Time and Date Policies. Only one server can be preferred (true)."
  type = object({
    ntp_server = string
    preferred  = bool
    mgmt       = string
    epg        = string
  })
}

locals {
  default_ntp = {
    ntp_server = "198.18.1.1"
    preferred  = false
    mgmt       = "oob"
    epg        = "default"
  }
  merged_ntp = merge(local.default_ntp, var.ntp)
}