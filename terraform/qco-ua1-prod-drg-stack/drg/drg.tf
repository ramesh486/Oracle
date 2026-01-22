#### DRG ####

resource oci_core_drg this {
  compartment_id = var.compartment_ocid
  defined_tags   = var.definedTags
  display_name   = var.drg_display_name
  freeform_tags  = var.freeformTags
}

### END