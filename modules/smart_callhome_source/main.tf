/*
API Information:
 - Class: "callhomeSmartSrc"
 - Distinguished Name: "uni/infra/moninfra-default/smartchsrc"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Smart CallHome Source
*/
resource "aci_rest" "SmartCallHome_Src" {
  path       = "/api/node/mo/uni/infra/moninfra-default/smartchsrc.json"
  class_name = "callhomeSmartSrc"
  payload    = <<EOF
{
  "callhomeSmartSrc": {
    "attributes": {
      "dn": "uni/infra/moninfra-default/smartchsrc"
    },
    "children": [
      {
        "callhomeRsSmartdestGroup": {
          "attributes": {
            "annotation": "${var.annotation}",
            "tDn": "${var.dest_group_dn}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
