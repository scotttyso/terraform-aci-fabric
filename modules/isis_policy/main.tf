/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
API Information:
 - Class: "isisDomPol"
 - Distinguished Name: "uni/fabric/isisDomP-default"
GUI Location:
 - System > System Settings > ISIS Policy
*/
resource "aci_rest" "ISIS_Policy" {
    path       = "/api/node/mo/uni/fabric/isisDomP-default.json"
    class_name = "isisDomPol"
    payload    = <<EOF
{
    "isisDomPol": {
        "attributes": {
            "dn": "uni/fabric/isisDomP-default",
            "mtu": "${var.mtu}",
            "redistribMetric": "${var.metric}"
        },
        "children": [
            {
                "isisLvlComp": {
                    "attributes": {
                        "lspFastFlood": "${var.lsp_fast_flood}",
                        "lspGenInitIntvl": "${var.lsp_initial_interval}",
                        "lspGenMaxIntvl": "${var.lsp_max_interval}",
                        "lspGenSecIntvl": "${var.lsp_second_interval}",
                        "spfCompInitIntvl": "${var.spf_initial_interval}",
                        "spfCompMaxIntvl": "${var.spf_max_interval}",
                        "spfCompSecIntvl": "${var.spf_second_interval}"
                    }
                }
            }
        ]
    }
}
    EOF
}
