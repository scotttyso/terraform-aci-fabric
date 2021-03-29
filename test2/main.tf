module "isis_policy" {
  source = "../modules/isis_policy"
  for_each  = local.isis_policy
  mtu                   = each.value.mtu
  metric                = each.value.metric
  lsp_fast_flood        = each.value.lsp_fast_flood
  lsp_initial_interval  = each.value.lsp_initial_interval
  lsp_max_interval      = each.value.lsp_max_interval
  lsp_second_interval   = each.value.lsp_second_interval
  spf_initial_interval  = each.value.spf_initial_interval
  spf_max_interval      = each.value.spf_max_interval
  spf_second_interval   = each.value.spf_second_interval
}
