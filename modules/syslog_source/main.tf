/*
API Information:
 - Class: "syslogSrc"
 - Distinguished Name: "uni/fabric/moncommon/slsrc-{Syslog Source Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source
*/
resource "aci_rest" "syslog_source" {
  path       = "/api/node/mo/uni/fabric/moncommon/slsrc-${var.source_group}.json"
  class_name = "syslogSrc"
  payload    = <<EOF
{
  "syslogSrc": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "uni/fabric/moncommon/slsrc-${var.source_group}",
      "incl": "${var.incl_types}",
      "name": "${var.source_group}",
      "nameAlias": "${var.name_alias}",
      "minSev": "${var.min_level}",
    },
    "children": [
      {
        "syslogRsDestGroup": {
          "attributes": {
            "tDn": "${var.dest_group_dn}",
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
