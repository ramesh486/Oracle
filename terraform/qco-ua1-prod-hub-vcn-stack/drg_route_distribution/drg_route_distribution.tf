resource "oci_core_drg_route_distribution" "this" {
    #Required
    distribution_type = var.drg_route_distribution_distribution_type
    drg_id = var.drg_ocid

    #Optional
    defined_tags = var.definedTags
    display_name = var.drg_route_distribution_display_name
    freeform_tags = var.freeformTags
}
