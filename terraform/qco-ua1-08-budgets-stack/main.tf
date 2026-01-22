module "oci_budget" {
  source                           = "./budget_module"
  budget_amount                    = var.budget_amount
  tenancy_ocid                     = var.tenancy_ocid
  budget_reset_period              = var.budget_reset_period
  budget_target_name               = var.budget_target_name  
  budget_target_type               = var.budget_target_type
  
  budget_alert_rule_threshold      = var.budget_alert_rule_threshold
  budget_alert_rule_threshold_type = var.budget_alert_rule_threshold_type
  budget_alert_rule_type           = var.budget_alert_rule_type
  budget_alert_rule_message        = var.budget_alert_rule_message
  budget_alert_rule_recipients     = var.budget_alert_rule_recipients
} 
