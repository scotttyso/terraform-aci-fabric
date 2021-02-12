variable "dest_group" {
  type        = string
  description = "Smart CallHome Destination Group."
  default     = "default"
}

variable "receiver" {
  type        = string
  description = "Smart CallHome Receiver."
  default     = "default"
}

variable "contact_info" {
  type        = string
  description = "Smart CallHome Contact Information."
  default     = "admins@example.com"
}

variable "phone_number" {
  type        = string
  description = "Phone Number for Contact Group."
  default     = "+1 555-555-5555"
}

variable "street_addr" {
  type        = string
  description = "Street Address for APICs Physical Location."
  default     = "One Cisco Way, San Jose, CA 90210"
}

variable "contract_id" {
  type        = string
  description = "Support Contract for ACI Fabric."
  default     = "5555555"
}

variable "customer_id" {
  type        = string
  description = "Customer ID Assigned in the Contract."
  default     = "5555555"
}

variable "site_id" {
  type        = string
  description = "Site ID Assigned in the Contract."
  default     = "5555555"
}

variable "smtp_relay" {
  type        = string
  description = "SMTP Relay Server"
  default     = "smtp-relay@example.com"
}

variable "smtp_port" {
  type        = string
  description = "SMTP Relay Port"
  default     = "25"
}

variable "from_email" {
  type        = string
  description = "Email Address to use for sending notifications."
  default     = "admins@example.com"
}

variable "reply_email" {
  type        = string
  description = "For Email Notifications Email Address to use for reply."
  default     = "admins@example.com"
}

variable "to_email" {
  type        = string
  description = "For Email Notifications Email Address to send to."
  default     = "admins@example.com"
}

variable "mgmt" {
  type        = string
  description = "(inb|oob) Management Domain."
  default     = "oob"
}

variable "epg" {
  type        = string
  description = "EPG on the Management Domain to use."
  default     = "default"
}