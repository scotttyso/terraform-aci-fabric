# snmp_dest_grp - SNMP Trap Destination Group Terraform Module - aci_rest

## Usage

```hcl
module "snmp_dest_grp" {

  source = "terraform-aci//modules/snmp_dest_grp"

  # omitted...
}
```

This module will Create a SNMP Trap Destination Group.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "snmpGroup"
* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Trap Destination Group}"
* GUI Location: Admin > External Data Collectors > Monitoring Destinations > SNMP > {SNMP Trap Destination Group}

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
| description | SNMP Destination Group Description. | `string` | `""` | no |
| dest\_group\_name | Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group | `string` | `"default_oob"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| snmp\_dest\_grp | This output will provide the Distinguished Name of the SNMP Trap Destination Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
