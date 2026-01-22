resource "oci_core_drg_route_table" "this" {
    #Required
    drg_id = var.drg_ocid

    #Optional
    defined_tags = var.definedTags
    display_name = var.drg_route_table_display_name
    freeform_tags = var.freeformTags
    import_drg_route_distribution_id = var.drg_route_distribution_ocid
    is_ecmp_enabled = var.drg_route_table_is_ecmp_enabled
}