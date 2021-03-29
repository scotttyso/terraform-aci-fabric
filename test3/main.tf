module "isis_policy" {
  source = "../modules/isis_policy"
  mtu                   = var.mtu
  metric                = var.metric
  lsp_fast_flood        = var.lsp_fast_flood
  lsp_initial_interval  = var.lsp_initial_interval
  lsp_max_interval      = var.lsp_max_interval
  lsp_second_interval   = var.lsp_second_interval
  spf_initial_interval  = var.spf_initial_interval
  spf_max_interval      = var.spf_max_interval
  spf_second_interval   = var.spf_second_interval
}
