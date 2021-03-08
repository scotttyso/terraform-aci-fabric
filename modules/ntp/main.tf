/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-{NTP_Server}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "ntp" {
  path       = "/api/node/mo/uni/fabric/time-default/ntpprov-${var.name}.json"
  class_name = "datetimeNtpProv"
  payload    = <<EOF
{
  "datetimeNtpProv": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/fabric/time-default/ntpprov-${var.name}",
      "name": "${var.name}",
      "nameAlias": "${var.name_alias}",
      "preferred": "${var.preferred}"
    },
    "children": [
      {
        "datetimeRsNtpProvToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}"
          }
        }
      }
    ]
  }
}
  EOF
}
