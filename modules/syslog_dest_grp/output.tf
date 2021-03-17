output "syslog_dest_grp" {
  description = "This output will provide the Distinguished Name of the Syslog Destination Group."
  value       = aci_rest.syslog_destination_group.id
}
