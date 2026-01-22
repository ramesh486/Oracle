### Introduction

1. oci_budget_budget : Used to create and manage a Budget in OCI.

A budget helps to track and control spending on OCI resources (per tenancy, compartment, or tag-based filters).

We can set an amount (e.g., $1,000/month) and attach alert rules to notify,  when usage/cost crosses thresholds.

2. oci_budget_alert_rule : used to define alert rules for a budget created using oci_budget_budget.

Alert rules will notify, when:

    ✔ Actual usage exceeds X%
    ✔ Forecasted usage exceeds X%
    ✔ Spending anomalies occur

### Pre-requisites

1. oci_budget_budget variables

* Amount for the budget
* Reset period for the budget
* Display name for the budget
* Type of target on which the budget is applied

2. oci_budget_alert_rule variables

* Target for the budget (whole number or decimal) for budget
* budget_alert_rule_threshold_type
* budget_alert_rule_type
* budget_alert_rule_message
* budget_alert_rule_recipients
