# snmp_traps - SNMP Community Terraform Module - aci_rest

## Usage

```hcl
module "snmp_traps" {

  source = "terraform-aci/modules//snmp_traps"

  # omitted...
}
```

This module will deploy the recommended Fabric characteristics for the Fabric Policy Configuration.

These resources are created

* [SNMP Destination Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Source](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Trap Destination](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

SNMP Destination Group:
*-* Class: "snmpGroup"
*-* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Trap Destination Group}"

SNMP Source:
*-* Class: "snmpSrc"
*-* Distinguished Name: "uni/fabric/moncommon/snmpsrc-{Source Name}"

SNMP Trap Forward Destination:
*-* Class: "snmpTrapFwdServerP"
*-* Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[{Trap Server}]"

SNMP Trap Destination:
*-* Class: "snmpTrapDest"
*-* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Destination Group}/trapdest-{SNMP Trap Server}-port-{SNMP Port}"

GUI Location:

SNMP Destination Group:
*-* Admin > External Data Collectors > Monitoring Destinations > SNMP > {SNMP Trap Destination Group}

SNMP Source:
*-* Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
*-* Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group

SNMP Trap Forward Destination:
*-* Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers

SNMP Trap Destination:
*-* Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group: Trap Servers
