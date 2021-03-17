# snmp_trap_source - SNMP Trap Source Terraform Module - aci_rest

## Usage

```hcl
module "snmp_trap_source" {

  source = "terraform-aci//modules/snmp_trap_source"

  # omitted...
}
```

This module will Create a SNMP Trap Source.

These resources are created

* [SNMP Trap Source](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "snmpSrc"
* Distinguished Name: "uni/fabric/moncommon/snmpsrc-{Source Name}"
* GUI Location: Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP

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
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| snmp\_messages | Options are [none\|all\|audit\|events\|faults\|session].  Best Practice; recommendation, 'audit,events,faults'.  APIC default is 'all'.  Which Message Types to include with the SNMP Source. | `string` | `"audit,events,faults"` | no |
| snmp\_source\_name | Create a SNMP Source under Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP | `string` | `"default_oob"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
