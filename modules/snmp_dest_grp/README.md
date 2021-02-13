# snmp_trap_dest_grp - SNMP Trap Destination Group Terraform Module - aci_rest

## Usage

```hcl
module "snmp_trap_dest_grp" {

  source = "terraform-aci//modules/snmp_trap_dest_grp"

  # omitted...
}
```

This module will Create a SNMP Trap Destination Group.

These resources are created

* [SNMP Destination Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpGroup"
* Distinguished Name: "uni/fabric/snmpgroup-{SNMP Trap Destination Group}"

GUI Location:

SNMP Destination Group:

* Admin > External Data Collectors > Monitoring Destinations > SNMP > {SNMP Trap Destination Group}

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
| destination\_group | SNMP Destination Group Configuration. | <pre>object({<br>    # snmp_dest_group: Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group<br>    snmp_dest_group = string<br>    # dest_grp_descr: SNMP Destination Group Description.<br>    dest_grp_descr = string<br>  })</pre> | n/a | yes |
| snmp\_source | Configuration to Create a SNMP Source. | <pre>object({<br>    # snmp_dest_group: This should have already been created by the "destination_group" configuration.<br>    snmp_dest_group = string<br>    # snmp_source: Create a SNMP Source under Fabric > Fabric Policies > Policies > Monitoring > Common Policy > <br>    #              Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP<br>    snmp_source = string<br>    # snmp_messages: (none|all|audit|events|faults|session).  Best Practice; recommendation, 'audit,events,faults'.<br>    #                APIC default is 'all'.  Which Message Types to include with the SNMP Source.<br>    snmp_messages = string<br>  })</pre> | n/a | yes |
| snmp\_traps | SNMP Trap Server Variables | <pre>object({<br>    # snmp_dest_group: This should have already been created by the "destination_group" configuration.<br>    snmp_dest_group = string<br>    # snmp_server: IPv4 or IPv6 Address for the SNMP Server<br>    snmp_server = string<br>    # snmp_port: This will typically be 162.<br>    snmp_port = number<br>    # snmp_string: snmp user or snmp community to assign to the server<br>    snmp_string = string<br>    # security_level: (noauth|auth|priv)<br>    #                 auth - Authentication and no privacy<br>    #                 noauth - No authentication and no privacy - default for v1 and v2c<br>    #                 priv - Authentication and privacy<br>    security_level = string<br>    # snmp_version: (v1|v2c|v3).  v3 for snmp users and v1 or v2c for communities.<br>    snmp_version = string<br>    # mgmt: Either inb or oob (inb|oob)<br>    mgmt = string<br>    # epg: EPG contained within the Management Domain Specified above.  Typically "default"<br>    epg = string<br>  })</pre> | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->