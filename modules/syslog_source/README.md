# syslog_source - Syslog Source Terraform Module - aci_rest

## Usage

```hcl
module "syslog_source" {

  source = "terraform-aci-fabric//modules/syslog_source"

  # omitted...
}
```

This module will Create a Syslog Source in the Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source.

These resources are created:

* [Syslog Source](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "syslogSrc"
* Distinguished Name: "uni/fabric/moncommon/slsrc-{Syslog Source Name}"

GUI Location:

* Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source


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