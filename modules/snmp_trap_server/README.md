# snmp_trap_server - SNMP Trap Server Terraform Module - aci_rest

## Usage

```hcl
module "snmp_trap_server" {

  source = "terraform-aci//modules/snmp_trap_server"

  # omitted...
}
```

This module will deploy the recommended Fabric characteristics for the Fabric Policy Configuration.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**SNMP Trap Forward Destination:**

* Class: "snmpTrapFwdServerP"
* Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[{Trap Server}]"
* GUI Location: Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers

**SNMP Trap Destination:**

* Class: "snmpTrapDest"
* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Destination Group}/trapdest-{SNMP Trap Server}-port-{SNMP Port}"
* GUI Location: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group: Trap Servers

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| aci | >= 0.5.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| dest\_group\_dn | SNMP Trap Destination Group Distinguished Name.  This should have already been created by the 'snmp\_dest\_grp' module | `string` | n/a | yes |
| mgmt\_domain\_dn | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| security\_level | Options are (auth\|noauth\|priv)<br> - auth: Authentication and no privacy<br> - noauth: Default.  No authentication and no privacy.<br> - priv: Authentication and privacy | `string` | `"noauth"` | no |
| snmp\_port | Port for the SNMP Trap Server.  Default is 162 | `number` | `162` | no |
| snmp\_server | IPv4 or IPv6 Address of the SNMP Trap Server | `string` | `"198.18.1.1"` | no |
| snmp\_string | SNMP User or SNMP Community for authenticating to the SNMP Trap Server.  This is a Sensitive Parameter. | `string` | n/a | yes |
| snmp\_version | Options are (v1\|v2c\|v3).  Version 3 would be for SNMP User | `string` | `"v2c"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
