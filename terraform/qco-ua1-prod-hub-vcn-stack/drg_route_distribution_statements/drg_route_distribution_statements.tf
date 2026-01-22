
resource "oci_core_drg_route_distribution_statement" "this" {
    #Required
    drg_route_distribution_id = var.drg_route_distribution_ocid
    action = var.drg_route_distribution_statement_statements_action
    #Optional
    match_criteria {
    #Required
    match_type = var.drg_route_distribution_statement_statements_match_criteria_match_type

    #Optional
    attachment_type = var.drg_route_distribution_statement_statements_match_criteria_attachment_type
    drg_attachment_id = var.drg_attachment_ocid
    }
    priority = var.drg_route_distribution_statement_statements_priority

}
