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
*-* Class: "snmpClientGrpP"
*-* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"

SNMP Clients:
*-* Class: "snmpClientP"
*-* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"

GUI Location:

SNMP Client Group:
*-* Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

SNMP Clients:
*-* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries

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
| syslog | Syslog Destination and Source Groups | <pre>object({<br>    # community: SNMP Community value<br>    dest_group    = string<br>    description   = optional(string)<br>    log_format    = string<br>    incl_msec     = bool<br>    timezone      = bool<br>    console_state = string<br>    console_sev   = string<br>    local_state   = string<br>    local_sev     = string<br>    source_grp    = string<br>    incl_types    = string<br>    min_level     = string<br>  })</pre> | n/a | yes |
| syslog\_servers | Syslog Remote Servers | <pre>object({<br>    # community: SNMP Community value<br>    dest_group      = string<br>    syslog_name     = string<br>    syslog_server   = string<br>    syslog_port     = number<br>    syslog_severity = string<br>    facility        = string<br>    mgmt            = string<br>    epg             = string<br>  })</pre> | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->