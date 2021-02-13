# Terraform ACI Fabric Policies Module default Example

The purpose of this Example is to show the most basic example of the module when accepting all the defaults defined in the module.  Note that there are only four variables that need to be created for the modules which are snmp username and authentication key, snmp community string for communities, and for the trap server the user or community.  Obviously in a real deployment scenario you would want to change default IP addresses and other values in the modules.  But we want to show the most simple form of the deployment.

The reason the above variables are not created as part of the defaults is they are all variables that should be securely encrypted/protected using something like environment variables (at the most basic level), Terraform Cloud, or Vault.  Do not store the above variables in any directory that would be published to something public like github.com.  Terraform Cloud is a really great option because you can mark the variables as sensative which will securly protect them, and vault is an even better on top of that.

## Important Ordering Information

There is an important order to the creation of the modules.  Below is the outline that is important to follow:

SNMP Client(s):

* First: Create the SNMP Client Group (snmp_client_grp).
* Second: Assign the SNMP Client(s) to the Client Group (snmp_clients).

SNMP Trap Server(s):

* First: Create the SNMP Trap Destination Group (snmp_dest_grp).
* Second: Create the SNMP Trap Source (snmp_trap_src).
* Third: Assign the SNMP Trap Server(s) to the Trap Destination Group (snmp_trap_server).

Syslog Server(s):

* First: Create the Syslog Destination Group (syslog_dest_grp).
* Second: Create the Syslog Source (syslog_source).
* Third: Assign the Syslog Server(s) to the Syslog Destination Group (syslog_server).

## Important Note

The module defaults use the oob "default" EPG.  Inband doesn't have an EPG by default.  An Inband EPG must be created before running this script if you are not using the default "oob" EPG.

## Usage Example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Modules

No Modules.

## Resources

No resources.

## Inputs

No input.

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->