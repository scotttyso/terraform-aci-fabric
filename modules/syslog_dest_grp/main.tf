/*
API Information:
 - Class: "syslogGroup"
 - Distinguished Name: "uni/fabric/slgroup-{Destination Group Name}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}
*/
resource "aci_rest" "syslog_destination_group" {
  path       = "/api/node/mo/uni/fabric/slgroup-${var.dest_group_name}.json"
  class_name = "syslogGroup"
  payload    = <<EOF
{
  "syslogGroup": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "uni/fabric/slgroup-${var.dest_group_name}",
      "descr": "${var.description}",
      "format": "${var.log_format}",
      "includeMilliSeconds": "${var.incl_msec}",
      "includeTimeZone": "${var.timezone}",
      "name": "${var.dest_group_name}",
      "nameAlias": "${var.name_alias}"
    },
    "children": [
      {
        "syslogConsole": {
          "attributes": {
            "adminState": "${var.console_state}",
            "dn": "uni/fabric/slgroup-${var.dest_group_name}/console",
            "severity": "${var.console_sev}"
          },
          "children": []
        }
      },
      {
        "syslogFile": {
          "attributes": {
            "dn": "uni/fabric/slgroup-${var.dest_group_name}/file",
            "adminState": "${var.local_state}",
            "severity": "${var.local_sev}"
          },
          "children": []
        }
      },
      {
        "syslogProf": {
          "attributes": {
            "dn": "uni/fabric/slgroup-${var.dest_group_name}/prof",
            "rn": "prof"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
