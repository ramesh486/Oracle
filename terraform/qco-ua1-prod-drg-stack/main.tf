module "network_drg" {
    source                  = "./drg"
    compartment_ocid        = local.compartment_ocid
    definedTags             = var.project_tag.definedTags
    freeformTags            = var.project_tag.freeformTags
    drg_display_name        = var.network_drg_display_name
}