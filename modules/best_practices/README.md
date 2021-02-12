# best_practices - Fabric Recommended Settings Terraform Module - aci_rest

## Usage

```hcl
module "best_practices" {

  source = "terraform-aci-fabric//modules/best_practices"

  # omitted...
}
```

This module will configure the recommended Best practice settings for the ACI Fabric.

These resources modified:

API Information:

Fabric Settings:
*-* Class: "coopPol"
*-* Class: "fabricNodeControl"
*-* Class: "isisDomPol"
*-* Class: "l3IfPol"
*-* Distinguished Name: "uni/fabric"
*-* Distinguished Name: "uni/fabric/pol-default"
*-* Distinguished Name: "uni/fabric/nodecontrol-default"
*-* Distinguished Name: "uni/fabric/isisDomP-default"
*-* Distinguished Name: "uni/fabric/l3IfP-default"

Infrastructure Settings:
*-* Class: "infraSetPol"
*-* Class: "epLoopProtectP"
*-* Class: "epControlP"
*-* Class: "epIpAgingP"
*-* Class: "infraPortTrackPol"
*-* Class: "mcpInstPol"
*-* Class: "qosInstPol"
*-* Distinguished Name: "uni/infra/settings"
*-* Distinguished Name: "uni/infra/epLoopProtectP-default"
*-* Distinguished Name: "uni/infra/epCtrlP-default"
*-* Distinguished Name: "uni/infra/ipAgingP-default"
*-* Distinguished Name: "uni/infra/trackEqptFabP-default"
*-* Distinguished Name: "uni/infra/mcpInstP-default"
*-* Distinguished Name: "uni/infra/qosinst-default"

GUI Location:

Fabric Settings:

Assign the Preferred Mgmt Domain for Routing on the APICs
*-* System > System Settings > APIC Connectivity Preferences

Enable Strict COOP Group Policy
*-* System > System Settings > COOP Group

Telemetry & Enable DOM
*-* Fabric > Policies > Monitoring > Fabric Node Controls > default

ISIS Metric for redistributed Routes - 63
*-* System > System Settings > ISIS Policy

Enable BFD for Fabric-Facing Interfaces
*-* Fabric > Fabric Policies > Policies > L3 Interface > default > BFD ISIS Policy

Infrastructure Settings:

Fabric Wide Settings
*-* System > System Settings > Fabric Wide Settings
    Disable Remote EP Learning
    Enforce Subnet Check
    Turn on Domain Validation

Endpoint Controls
*-* System > System Settings > Endpoint Controls
    Endpoint Loop Protection - Enabled - recommended
    Rouge Endpoint Control - Enabled - recommended
    *-* Interval 30 seconds - recommended
    *-* Multiplier 6 - recommended
    *-* action - no actions is the default recommendation
    IP Aging - Enabled

Infrastructure Port Tracking - Enabled
*-* System > System Settings > Port Tracking

Mis-Cabling Protocol per-vlan Tracking
*-* Fabric > Access Policies > Global Policies > MCP Instance Policy default.

Preserve COS through the ACI Fabric
*-* Fabric > Access Policies > Policies > Global > QOS Class > Preserve COS
