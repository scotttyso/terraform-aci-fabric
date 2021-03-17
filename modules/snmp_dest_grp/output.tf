output "snmp_dest_grp" {
  description = "This output will provide the Distinguished Name of the SNMP Trap Destination Group."
  value       = aci_rest.snmp_trap_destination_group.id
}
