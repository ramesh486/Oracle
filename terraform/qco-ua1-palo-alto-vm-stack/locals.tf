locals{
    app_compartment_ocid          = data.oci_identity_compartments.app_compartment.compartments[0].id
    network_compartment_ocid      = data.oci_identity_compartments.network_compartment.compartments[0].id
    mgmt_subnet_ocid              = data.oci_core_subnets.mgmt.subnets[0].id
    untrst_subnet_ocid            = data.oci_core_subnets.untrust.subnets[0].id
    trust_subnet_ocid             = data.oci_core_subnets.trust.subnets[0].id
    hub_subnet_ocid               = data.oci_core_subnets.hub.subnets[0].id
}
