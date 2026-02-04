data "oci_identity_compartments" "app_compartment" {
    compartment_id               = var.tenancy_ocid
    compartment_id_in_subtree    = var.app_compartment_id_in_subtree
    name                         = var.app_compartment_name
}

data "oci_identity_compartments" "network_compartment" {
    compartment_id               = var.tenancy_ocid
    compartment_id_in_subtree    = var.network_compartment_id_in_subtree
    name                         = var.network_compartment_name
}
data "oci_core_subnets" "this" {
    compartment_id               = local.network_compartment_ocid
	filter {
        name                     = "display_name"
        values                   = ["${var.subnet_display_name}"]
    }
}
