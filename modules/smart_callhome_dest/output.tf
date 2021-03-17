output "smart_callhome_dest" {
  description = "This output will provide the Distinguished Name of the Smart CallHome Destination Group."
  value       = aci_rest.SmartCallHome_destGrp.id
}
