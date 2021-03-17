# syslog_dest_grp - Syslog Destination Group Terraform Module - aci_rest

## Usage

```hcl
module "syslog_dest_grp" {

  source = "terraform-aci-fabric//modules/syslog_dest_grp"

  # omitted...
}
```

This module will Create a Syslog Destination Group in the External Data Collectors > Monitoring Destinations > Syslog.

These resources are created:

* [Syslog Destination Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "syslogGroup"
* Distinguished Name: "uni/fabric/slgroup-{Destination Group Name}"

GUI Location:

* GUI Location: Admin > External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}

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
| console\_sev | Options are (emergencies\|alerts\|critical).  Set the console logging level. | `string` | `"critical"` | no |
| console\_state | Options are (enabled\|disabled).  Enable or disable console logging on the switches. | `string` | `"enabled"` | no |
| description | Syslog Destination Group Description. | `string` | `""` | no |
| dest\_group\_name | Create the Syslog Destination Group: External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}. | `string` | `"default_oob"` | no |
| incl\_msec | Options are (true\|false).  Include msec in the log timestamp. | `bool` | `true` | no |
| local\_sev | Options are (emergencies\|alerts\|critical\|errors\|warnings\|notifications\|information\|debugging).  Set the local logging level. | `string` | `"information"` | no |
| local\_state | Options are [enabled\|disabled].  Enable or disable console logging on the switches. | `string` | `"enabled"` | no |
| log\_format | Options are (aci\|nxos).  Default is aci.  Choose whether you want the logs to be sent in NX-OS format or ACI Format. | `string` | `"aci"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| timezone | Options are (true\|false).  Include the local time zone in the log timestamp. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| syslog\_dest\_grp | This output will provide the Distinguished Name of the Syslog Destination Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
