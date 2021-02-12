variable "ntp" {
  description = "Deploy NTP Servers for Time and Date Policies. Only one server can be preferred (true)"
  type = object({
    ntp_server = string
    preferred  = string
    mgmt       = string
    epg        = string
  })
  default = [
    {
      ntp_server = "198.18.1.1"
      preferred  = "false"
      mgmt       = "oob"
      epg        = "default"
    }
  ]
}