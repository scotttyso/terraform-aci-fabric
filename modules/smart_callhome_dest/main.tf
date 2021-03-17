/*
API Information:
 - Class: "callhomeSmartGroup"
 - Distinguished Name: "uni/fabric/smartgroup-{Smart CallHome Destination Group}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > [Smart CallHome Destination Group]
*/
resource "aci_rest" "SmartCallHome_destGrp" {
  path       = "/api/node/mo/uni/fabric/smartgroup-${var.dest_group_name}.json"
  class_name = "callhomeSmartGroup"
  payload    = <<EOF
{
  "callhomeSmartGroup": {
    "attributes": {
      "annotation": "${var.annotation_callhome}",
      "descr": "${var.description}",
      "dn": "uni/fabric/smartgroup-${var.dest_group_name}",
      "name": "${var.dest_group_name}",
      "nameAlias": "${var.name_alias_callhome}"
    },
    "children": [
      {
        "callhomeProf": {
          "attributes": {
            "addr": "${var.street_addr}",
            "adminState": "${var.admin_state}",
            "annotation": "${var.annotation_profile}",
            "contact": "${var.contact_info}",
            "contract": "${var.contract_id}",
            "customer": "${var.customer_id}",
            "descr": "${var.description}",
            "dn": "uni/fabric/smartgroup-${var.dest_group_name}/prof",
            "email": "${var.email_to}",
            "from": "${var.email_from}",
            "nameAlias": "${var.name_alias_profile}",
            "phone": "${var.phone_number}",
            "port": "${var.smtp_port}",
            "replyTo": "${var.email_reply}",
            "site": "${var.site_id}"
          },
          "children": [
            {
              "callhomeSmtpServer": {
                "attributes": {
                  "dn": "uni/fabric/smartgroup-${var.dest_group_name}/prof/smtp",
                  "host": "${var.smtp_server}"
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
          ]
        }
      },
      {
        "callhomeSmartDest": {
          "attributes": {
            "dn": "uni/fabric/smartgroup-${var.dest_group_name}/smartdest-${var.receiver}",
            "name": "${var.receiver}",
            "email": "${var.email_reply}",
            "format": "short-txt"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
