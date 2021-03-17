output "snmp_client_grp" {
  description = "This output will provide the Distinguished Name of the SNMP Client Group."
  value       = aci_rest.snmp_client_group.id
}
