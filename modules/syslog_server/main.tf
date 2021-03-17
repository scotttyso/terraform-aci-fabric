/*
API Information:
 - Class: "syslogRemoteDest"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{Mgmt_EPG}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name} > Create Syslog Remote Destination
*/
resource "aci_rest" "syslog_server" {
  path       = "/api/node/mo/${var.dest_group_dn}/rdst-${var.syslog_server}.json"
  class_name = "syslogRemoteDest"
  payload    = <<EOF
{
  "syslogRemoteDest": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "${var.dest_group_dn}/rdst-${var.syslog_server}",
      "forwardingFacility": "${var.facility}",
      "host": "${var.syslog_server}",
      "name": "${var.syslog_name}",
      "nameAlias": "${var.name_alias}",
      "port": "${var.syslog_port}",
      "severity": "${var.syslog_severity}",
    },
    "children": [
      {
        "fileRsARemoteHostToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
