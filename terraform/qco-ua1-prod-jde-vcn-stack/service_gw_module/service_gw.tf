resource oci_core_service_gateway this {
  compartment_id = var.compartment_ocid
  defined_tags = var.definedTags
  display_name = var.servicegw_display_name
  freeform_tags = var.freeformTags
  services {
    service_id = data.oci_core_services.this.services.1.id
  }
  vcn_id = var.vcn_ocid
}