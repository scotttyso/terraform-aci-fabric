# smart_callhome_dest - Smart CallHome Destination Group Terraform Module - aci_rest

## Usage

```hcl
module "smart_callhome_dest" {

  source = "terraform-aci-fabric//modules/smart_callhome_dest"

  # omitted...
}
```

This module will Configure the Smart CallHome Destination Group for the ACI Fabric.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**Smart CallHome Destination Group:**

* Class: "callhomeSmartGroup"
* Distinguished Name: "uni/fabric/smartgroup-{Smart CallHome Destination Group}"
* GUI Location: Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > [Smart CallHome Destination Group]

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
| annotation\_callhome | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| annotation\_profile | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| contact\_info | Smart CallHome Contact Information.  Typically the | `string` | `"admins@example.com"` | no |
| contract\_id | Support Contract for ACI Fabric. | `string` | `"55555555"` | no |
| customer\_id | Customer ID Assigned in the Contract. | `string` | `"55555555"` | no |
| description | A description for the Smart CallHome Destination Group. | `string` | `""` | no |
| dest\_group\_name | Smart CallHome Destination Group Name. | `string` | `"default"` | no |
| email\_from | Email Address to use for sending notifications. | `string` | `"admins@example.com"` | no |
| email\_reply | For Email Notifications Email Address to use for reply. | `string` | `"admins@example.com"` | no |
| email\_to | For Email Notifications Email Address to send to. | `string` | `"admins@example.com"` | no |
| mgmt\_domain\_dn | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| phone\_number | Phone Number for Contact Group. | `string` | `"+1 555-555-5555"` | no |
| receiver | Smart CallHome Receiver. | `string` | `"default"` | no |
| site\_id | Site ID Assigned in the Contract. | `string` | `"55555555"` | no |
| smtp\_port | SMTP Relay Port | `number` | `25` | no |
| smtp\_server | SMTP Relay Server | `string` | `"smtp-relay.example.com"` | no |
| street\_addr | Street Address for APICs Physical Location. | `string` | `"One Cisco Way, San Jose, CA 90210"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
