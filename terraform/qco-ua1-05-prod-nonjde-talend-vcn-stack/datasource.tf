data "oci_identity_compartments" "this" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = var.compartment_id_in_subtree
  name                      = var.compartment_name
}

data "oci_identity_compartments" "hub" {
  compartment_id            = var.tenancy_ocid
  compartment_id_in_subtree = var.compartment_id_in_subtree
  name                      = var.hub_compartment_name
}

data "oci_core_drgs" "this" {
  compartment_id = local.compartment_ocid
  filter {
    name   = "display_name"
    values = ["${var.drg_display_name}"]
  }
}

data "oci_core_drg_route_tables" "this" {
  #Required
  drg_id = local.drg_ocid

  #Optional
  display_name = var.spoke_vcn_drg_route_table_display_name
}


data "oci_core_local_peering_gateways" "prod_hub_lpg" {
  #Required
  compartment_id = local.hub_compartment_ocid

  filter {
    name   = "display_name"
    values = ["${var.prod_hub_vcn_to_prod_nonjde_talend_vcn_lpg_display_name}"]
  }
}



data "oci_core_services" "this" {}
