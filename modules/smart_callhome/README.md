# snmp_clients - SNMP Clients Terraform Module - aci_rest

## Usage

```hcl
module "snmp_clients" {

  source = "terraform-aci-fabric/modules/snmp_clients"

  # omitted...
}
```

This module will Add SNMP Clients to a SNMP Client Group in the default SNMP Policy.

These resources are created:

* [SNMP Client Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Clients](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

SNMP Client Group:

* Class: "snmpClientGrpP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"

SNMP Clients:

* Class: "snmpClientP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"

GUI Location:

SNMP Client Group:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

SNMP Clients:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries

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
| contact\_info | Smart CallHome Contact Information. | `string` | `"admins@example.com"` | no |
| contract\_id | Support Contract for ACI Fabric. | `string` | `"5555555"` | no |
| customer\_id | Customer ID Assigned in the Contract. | `string` | `"5555555"` | no |
| dest\_group | Smart CallHome Destination Group. | `string` | `"default"` | no |
| epg | EPG on the Management Domain to use. | `string` | `"default"` | no |
| from\_email | Email Address to use for sending notifications. | `string` | `"admins@example.com"` | no |
| mgmt | (inb\|oob) Management Domain. | `string` | `"oob"` | no |
| phone\_number | Phone Number for Contact Group. | `string` | `"+1 555-555-5555"` | no |
| receiver | Smart CallHome Receiver. | `string` | `"default"` | no |
| reply\_email | For Email Notifications Email Address to use for reply. | `string` | `"admins@example.com"` | no |
| site\_id | Site ID Assigned in the Contract. | `string` | `"5555555"` | no |
| smtp\_port | SMTP Relay Port | `string` | `"25"` | no |
| smtp\_relay | SMTP Relay Server | `string` | `"smtp-relay@example.com"` | no |
| street\_addr | Street Address for APICs Physical Location. | `string` | `"One Cisco Way, San Jose, CA 90210"` | no |
| to\_email | For Email Notifications Email Address to send to. | `string` | `"admins@example.com"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->