resource "oci_core_drg_route_table_route_rule" "this" {
    #Required
    drg_route_table_id = var.drg_route_table_ocid
    destination = var.drg_route_table_route_rule_destination
    destination_type = var.drg_route_table_route_rule_destination_type
    next_hop_drg_attachment_id = var.drg_attachment_ocid
}