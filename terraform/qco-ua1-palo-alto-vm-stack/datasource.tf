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

data "oci_core_subnets" "mgmt" {
  compartment_id = local.network_compartment_ocid

  filter {
    name   = "display_name"
    values = [var.primary_mgmt_subnet_display_name]
  }
}

data "oci_core_subnets" "untrust" {
  compartment_id = local.network_compartment_ocid

  filter {
    name   = "display_name"
    values = [var.secondary_untrust_subnet_display_name]
  }
}

data "oci_core_subnets" "trust" {
  compartment_id = local.network_compartment_ocid

  filter {
    name   = "display_name"
    values = [var.secondary_trust_subnet_display_name]
  }
}

data "oci_core_subnets" "hub" {
  compartment_id = local.network_compartment_ocid

  filter {
    name   = "display_name"
    values = [var.secondary_hub_subnet_display_name]
  }
}
