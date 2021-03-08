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
      "dn": "uni/fabric/smartgroup-${var.dest_group_name}",
      "name": "${var.dest_group_name}",
    },
    "children": [
      {
        "callhomeProf": {
          "attributes": {
            "addr": "${var.street_addr}",
            "contact": "${var.contact_info}",
            "contract": "${var.contract_id}",
            "customer": "${var.customer_id}",
            "dn": "uni/fabric/smartgroup-${var.dest_group_name}/prof",
            "email": "${var.email_to}",
            "from": "${var.email_from}",
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
            "dn": "uni/fabric/smartgroup-${var.dest_group}/smartdest-${var.receiver}",
            "name": "${var.receiver}",
            "email": "${var.reply_email}",
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
      "dn": "uni/infra/moninfra-default/smartchsrc",
    },
    "children": [
      {
        "callhomeRsSmartdestGroup": {
          "attributes": {
            "tDn": "uni/fabric/smartgroup-${var.dest_group}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
