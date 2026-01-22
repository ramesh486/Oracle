data "oci_identity_compartments" "this" {
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  compartment_id_in_subtree = var.compartment_id_in_subtree
  name                      = var.compartment_name
}

data "oci_identity_compartments" "prod_compartment" {
  #Required
  compartment_id = var.tenancy_ocid

  #Optional
  compartment_id_in_subtree = var.compartment_id_in_subtree
  name                      = var.prod_network_compatment_name
}

data "oci_core_services" "this" {}

data "oci_core_drg_route_tables" "this" {
  #Required
  drg_id = local.drg_ocid

  #Optional
  display_name = var.spoke_vcn_drg_route_table_display_name
}

data "oci_core_drgs" "this" {

  compartment_id = local.prod_compartment_ocid

  filter {
    name   = "display_name"
    values = ["${var.drg_display_name}"]
  }
}


data "oci_core_local_peering_gateways" "this" {
  #Required
  compartment_id = local.prod_compartment_ocid

  filter {
    name   = "display_name"
    values = ["${var.exadata_vcn_to_nprd_jde_vcn_lpg_display_name}"]
  }
}

data "oci_core_local_peering_gateways" "prod_hub_lpg" {
  #Required
  compartment_id = local.prod_compartment_ocid

  filter {
    name   = "display_name"
    values = ["${var.prod_hub_vcn_to_nprd_jde_vcn_lpg_display_name}"]
  }
}
