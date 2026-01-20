data "oci_identity_compartments" "this" {
    compartment_id = var.tenancy_ocid
    compartment_id_in_subtree = var.compartment_id_in_subtree
    name       = var.compartment_name
}
