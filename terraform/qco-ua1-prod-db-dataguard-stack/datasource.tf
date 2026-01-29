data "oci_identity_compartments" "this" {
    compartment_id               = var.tenancy_ocid
    compartment_id_in_subtree    = var.compartment_id_in_subtree
    name                         = var.compartment_name
}

data "oci_core_subnets" "sn_db_prod_subnet" {
    compartment_id     = local.network_compartment_ocid
	filter {
        name            = "display_name"
        values           = ["${var.sn_db_prod_display_name}"]
    }
}

data "oci_identity_compartments" "network" {
    compartment_id               = var.tenancy_ocid
    compartment_id_in_subtree    = var.network_compartment_id_in_subtree
    name                         = var.network_compartment_name
}

data "oci_core_subnets" "sn_sec_db_prod_subnet" {
    compartment_id     = local.network_compartment_ocid
	filter {
        name            = "display_name"
        values           = ["${var.sn_sec_db_prod_display_name}"]
    }
}


     