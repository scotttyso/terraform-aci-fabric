/*
API Information:
 - Class: "syslogGroup"
 - Distinguished Name: "uni/fabric/slgroup-{Dest Group Name}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > {Dest Group Name}
*/
resource "aci_rest" "syslog_destination_grp" {
  for_each   = var.syslog
  path       = "/api/node/mo/uni/fabric/slgroup-${var.value.dest_group}.json"
  class_name = "syslogGroup"
  payload    = <<EOF
{
	"syslogGroup": {
		"attributes": {
			"dn": "uni/fabric/slgroup-${var.value.dest_group}",
			"name": "${var.value.dest_group}",
			"descr": ""${var.value.description}",
            "format": "${var.value.log_format}",
			"includeMilliSeconds": "${var.value.incl_msec}",
			"includeTimeZone": "${var.value.timezone}"
		},
		"children": [
			{
				"syslogConsole": {
					"attributes": {
						"dn": "uni/fabric/slgroup-${var.value.dest_group}/console",
                        "adminState": "${var.value.console_state}",
                        "severity": "${var.value.console_sev}",
                        "rn": "console"
					},
					"children": []
				}
			},
			{
				"syslogFile": {
					"attributes": {
						"dn": "uni/fabric/slgroup-${var.value.dest_group}/file",
                        "adminState": "${var.value.local_state}",
                        "severity": "${var.value.local_sev}",
                        "rn": "file"
					},
					"children": []
				}
			},
			{
				"syslogProf": {
					"attributes": {
						"dn": "uni/fabric/slgroup-${var.value.dest_group}/prof",
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

/*
API Information:
 - Class: "syslogSrc"
 - Distinguished Name: "uni/fabric/moncommon/slsrc-{Syslog Source Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source
*/
resource "aci_rest" "syslog_src" {
  for_each   = var.syslog
  path       = "/api/node/mo/uni/fabric/moncommon/slsrc-${var.source_grp}.json"
  class_name = "syslogSrc"
  payload    = <<EOF
{
	"syslogSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/slsrc-${var.source_grp}",
			"name": "${var.source_grp}",
			"incl": "${var.incl_types}",
            "minSev": "${var.min_level}",
		},
		"children": [
			{
				"syslogRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/slgroup-${var.dest_group}",
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
 - Class: "syslogRemoteDest"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{Mgmt_EPG}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name} > Create Syslog Remote Destination
*/
resource "aci_rest" "syslog_srvrs" {
  for_each   = var.syslog_srvrs
  depends_on = [aci_rest.syslog_destination_grp]
  path       = "/api/node/mo/uni/fabric/slgroup-${var.value.dest_group}/rdst-${var.value.syslog_srvr}.json"
  class_name = "syslogRemoteDest"
  payload    = <<EOF
{
	"syslogRemoteDest": {
		"attributes": {
			"dn": "uni/fabric/slgroup-default/rdst-${var.value.syslog_srvr}",
			"host": "${var.value.syslog_srvr}",
			"name": "${var.value.name}",
			"forwardingFacility": "${var.value.facility}",
			"port": "${var.value.syslog_port}",
			"severity": "${var.value.syslog_severity}",
		},
		"children": [
			{
				"fileRsARemoteHostToEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/${var.value.mgmt}-${var.value.epg}"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}