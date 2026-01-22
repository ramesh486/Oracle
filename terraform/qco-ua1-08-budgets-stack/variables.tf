variable "region" {
    type = string
    default = "us-ashburn-1"
    description = "Region (us-ashburn-1) to deploy the Budgets"
}
variable "tenancy_ocid"{
    type = string
    default =  ""
    description = "Tenancy ID to deploy the Budgets"
}
variable "user_ocid"{
    type = string
    default =  ""
    description = "User ID to deploy the Budgets"
}
variable "fingerprint"{
    type = string
    default =  ""
    description = "fingerprint to deploy the Budgets"
}
variable "api_private_key"{
    type = string
    default =  ""
    description = "private key to deploy the Budgets"
}

### Variables for oci_budget_budget ###

variable "budget_amount" {
  default     = "100000"
  description = "The Amount for the budget"
  type        = number
}

variable "budget_reset_period" {
  description = "The reset period for the budget."
  default     = "MONTHLY"
  type        = string
}

variable "budget_target_name" {
  default     = "Test-budget"
  description = "The Display name for the budget"
  type        = string
}

variable "budget_target_type" {
  description = "The type of target on which the budget is applied."
  default     = "COMPARTMENT"
  type        = string
}

#### Variables for Budget alert rules #####

variable "budget_alert_rule_threshold" {
  default     = "100"
  description = "The target for the budget (whole number or decimal) for budget"
  type        = number
}

variable "budget_alert_rule_threshold_type" {
  description = "Type of threshold: <ABSOLUTE|PERCENTAGE> for budget. ABSOLUTE : the threshold is a fixed amount. PERCENTAGE: the maximum value is 10000"
  default     = "ABSOLUTE"
  type        = string
}

variable "budget_alert_rule_type" {
  description = "Type of alert rule : <ACTUAL|FORECAST> usage for budget"
  default     = "ACTUAL"
  type        = string
}

variable "budget_alert_rule_message" {
  description = "what the alert is about ie, sent when alert triggers."
  default     = "Default budget alert"
  type        = string
}

variable "budget_alert_rule_recipients" {
  default     = ""
  description = "Provide one or more emails address for budget"
  type        = string
}

### END
