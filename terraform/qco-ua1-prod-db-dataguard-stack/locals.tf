locals{
    compartment_ocid             = data.oci_identity_compartments.this.compartments[0].id
    db_prod_subnet_ocid       = data.oci_core_subnets.sn_db_prod_subnet.subnets[0].id
    network_compartment_ocid     = data.oci_identity_compartments.network.compartments[0].id
    db_prod_sec_subnet_ocid   = data.oci_core_subnets.sn_sec_db_prod_subnet.subnets[0].id
   
}
