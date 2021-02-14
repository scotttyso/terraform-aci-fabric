variable "aciUser" {
  description = "If using a Domain with the User Remember to add apic#[domain]\\<username>"
  type        = string
  default     = "admin"
}

variable "aciPass" {
  description = "NEVER Store your USERNAME or PASSWORD in a Public Repository"
  type        = string
  default     = "cisco123"
}

variable "aciUrl" {
  description = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type        = string
  default     = "https://brahma-apic2.rich.ciscolabs.com"
}