/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard
*/

/*
Assign the oob as the default Management Interface for the APICs
API Information:
 - Class: "mgmtConnectivityPrefs"
 - Distinguished Named "uni/fabric/connectivityPrefs"
GUI Location:
 - System > System Settings > APIC Connectivity Preferences
*/
resource "aci_rest" "connectivity_preference" {
	path       = "/api/node/mo/uni/fabric/connectivityPrefs.json"
	class_name = "mgmtConnectivityPrefs"
	payload    = <<EOF
{
	"mgmtConnectivityPrefs": {
		"attributes": {
			"dn": "uni/fabric/connectivityPrefs",
			"interfacePref": "${var.mgmt_preference}"
		},
		"children": []
	}
}
	EOF
}

/*
Assign Best Practice Values for the Following Settings
 - Enable Strict COOP Group Policy
   System > System Settings > COOP Group
 - Telemetry & Enable DOM
   Fabric > Policies > Monitoring > Fabric Node Controls > default
 - ISIS Metric for redistributed Routes - 63
   System > System Settings > ISIS Policy
 - Enable BFD for Fabric-Facing Interfaces 
   Fabric > Fabric Policies > Policies > L3 Interface > default > BFD ISIS Policy
API Information:
 - Class: "fabricInst"
 - Class: "coopPol"
 - Class: "fabricNodeControl"
 - Class: "isisDomPol"
 - Class: "l3IfPol"
 - Distinguished Name: "uni/fabric"
 - Distinguished Name: "uni/fabric/pol-default"
 - Distinguished Name: "uni/fabric/nodecontrol-default"
 - Distinguished Name: "uni/fabric/isisDomP-default"
 - Distinguished Name: "uni/fabric/l3IfP-default"
GUI Location:
 - System > System Settings > APIC Connectivity Preferences
*/
resource "aci_rest" "fabric_best_practice" {
	path       = "/api/node/mo/uni/fabric.json"
	class_name = "fabricInst"
	payload    = <<EOF
{
    "fabricInst": {
        "attributes": {
            "dn": "uni/fabric"
        },
        "children": [
			{
				"coopPol": {
					"attributes": {
						"dn": "uni/fabric/pol-default",
						"rn": "pol-default",
						"type": "${var.coop_policy}"
					},
					"children": []
				}
			},
			{
				"fabricNodeControl": {
					"attributes": {
						"dn": "uni/fabric/nodecontrol-default",
						"control": "${var.dom}",
						"descr": "${var.dom_descr}"
					},
					"children": []
				}
			},
            {
                "isisDomPol": {
                    "attributes": {
                        "dn": "uni/fabric/isisDomP-default",
                        "rn": "isisDomP-default",
                        "redistribMetric": "${var.isis_metric}"
					},
					"children": []
				}
			},
			{
				"l3IfPol": {
					"attributes": {
						"dn": "uni/fabric/l3IfP-default",
						"bfdIsis": "${var.fabric_bfd}",
						"descr": "Fabric BFD Policy"
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
Assign Best Practice Values for the Following Settings
API Information:
 - Class: "infraInfra"
 - Class: "infraSetPol"
 - Class: "epLoopProtectP"
 - Class: "epControlP"
 - Class: "epIpAgingP"
 - Class: "infraPortTrackPol"
 - Class: "mcpInstPol"
 - Class: "qosInstPol"
 - Distinguished Name: "uni/infra"
 - Distinguished Name: "uni/infra/settings"
 - Distinguished Name: "uni/infra/epLoopProtectP-default"
 - Distinguished Name: "uni/infra/epCtrlP-default"
 - Distinguished Name: "uni/infra/ipAgingP-default"
 - Distinguished Name: "uni/infra/trackEqptFabP-default"
 - Distinguished Name: "uni/infra/mcpInstP-default"
 - Distinguished Name: "uni/infra/qosinst-default"
GUI Location:
 - System > System Settings > Fabric Wide Settings
   Disable Remote EP Learning
   Enforce Subnet Check
   Turn on Domain Validation
 - Endpoint Controls
   System > System Settings > Endpoint Controls
   - Endpoint Loop Protection - Enabled
   - Rouge Endpoint Control - Enabled
	 Interval 30 seconds
	 Multiplier 6
   - IP Aging - Enabled
 - Infrastructure Port Tracking - Enabled
   System > System Settings > Port Tracking
 - Mis-Cabling Protocol per-vlan Tracking 
   Fabric > Access Policies > Global Policies > MCP Instance Policy default.
 - Preserve COS through the ACI Fabric
   Fabric > Access Policies > Policies > Global > QOS Class > Preserve COS

*/
resource "aci_rest" "infra_best_practice" {
	path       = "/api/node/mo/uni/infra.json"
	class_name = "infraInfra"
	payload    = <<EOF
{
	"infraInfra": {
		"attributes": {
			"dn": "uni/infra",
		},
		"children": [
			{
				"infraSetPol": {
					"attributes": {
						"dn": "uni/infra/settings",
						"domainValidation": "true",
						"enforceSubnetCheck": "true",
						"unicastXrEpLearnDisable": "true"
					},
					"children": []
				}
			},
			{
				"epLoopProtectP": {
					"attributes": {
						"dn": "uni/infra/epLoopProtectP-default",
						"adminSt": "enabled",
						"action": "",
						"rn": "epLoopProtectP-default"
					},
					"children": []
				}
			},
			{
				"epControlP": {
					"attributes": {
						"dn": "uni/infra/epCtrlP-default",
						"adminSt": "enabled",
						"rogueEpDetectIntvl": "30",
						"rogueEpDetectMult": "6",
						"rn": "epCtrlP-default"
					},
					"children": []
				}
			},
			{
				"epIpAgingP": {
					"attributes": {
						"dn": "uni/infra/ipAgingP-default",
						"rn": "ipAgingP-default",
						"adminSt": "enabled"
					},
					"children": []
				}
			},
			{
				"infraPortTrackPol": {
					"attributes": {
						"dn": "uni/infra/trackEqptFabP-default",
						"adminSt": "on"
					},
					"children": []
				}
			},
			{
				"mcpInstPol": {
					"attributes": {
						"dn": "uni/infra/mcpInstP-default",
						"descr": "Configured using Terraform ACI Provider Deployment Script",
						"ctrl": "pdu-per-vlan",
						"adminSt": "enabled",
						"key": "cisco"
					},
					"children": []
				}
			},
			{
				"qosInstPol": {
					"attributes": {
						"dn": "uni/infra/qosinst-default",
						"ctrl": "dot1p-preserve"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}