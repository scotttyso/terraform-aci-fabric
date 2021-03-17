# smart_callhome_source - Smart CallHome Source Terraform Module - aci_rest

## Usage

```hcl
module "smart_callhome_source" {

  source = "terraform-aci-fabric//modules/smart_callhome_source"

  # omitted...
}
```

This module will Configure the Smart CallHome Source for the ACI Fabric.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**Smart CallHome Source:**

* Class: "callhomeSmartSrc"
* Distinguished Name: "uni/infra/moninfra-default/smartchsrc"
* GUI Location: Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Smart CallHome Source

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
| dest\_group\_dn | Smart CallHome Destination Group Distinguished Name.  This should have already been created by the 'smart\_callhome\_dest' module | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
