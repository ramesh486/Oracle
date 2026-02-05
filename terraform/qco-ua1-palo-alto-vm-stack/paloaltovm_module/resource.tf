resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = var.is_management_disabled
		is_monitoring_disabled = var.is_monitoring_disabled
		

		plugins_config {
			desired_state = var.desired_state1
			name = var.name1
		}
		plugins_config {
			desired_state = var.desired_state2
			name = var.name2
		}
		plugins_config {
			desired_state = var.desired_state3
			name = var.name3
		}
		plugins_config {
			desired_state = var.desired_state4
			name = var.name4
		}
		plugins_config {
			desired_state = var.desired_state5
			name = var.name5
		}
		plugins_config {
			desired_state = var.desired_state6
			name = var.name6
		}
		plugins_config {
			desired_state = var.desired_state7
			name = var.name7
		}
		plugins_config {
			desired_state = var.desired_state8
			name = var.name8
		}
		plugins_config {
			desired_state = var.desired_state9
			name = var.name9
		}
		plugins_config {
			desired_state = var.desired_state10
			name = var.name10
		}
		
	}
	
    metadata  = {
    ssh_keys = var.ssh_keys
  }

  
	availability_config {
		recovery_action = var.recovery_action
	}
	
	availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0]["name"]
	compartment_id = var.compartment_ocid
	create_vnic_details {
		assign_private_dns_record = var.assign_private_dns_record_primary
		assign_public_ip = var.assign_public_ip_primary
		subnet_id = var.mgmt_subnet_ocid
	}
	
	display_name = var.display_name
	instance_options {
		are_legacy_imds_endpoints_disabled = var.are_legacy_imds_endpoints_disabled
	}
	shape = var.shape
	shape_config {
		memory_in_gbs = var.memory_in_gbs
		ocpus = var.ocpus
	}
	source_details {
		source_id = var.source_id
		source_type = var.source_type
	}
	depends_on = [
		oci_core_app_catalog_subscription.generated_oci_core_app_catalog_subscription
	]
	defined_tags             = var.project_tag.definedTags
    freeform_tags            = var.project_tag.freeformTags

}

resource "oci_core_vnic_attachment" "secondary_vnic_1" {
  instance_id = oci_core_instance.generated_oci_core_instance.id
  display_name = "${var.display_name}-untrst-vnic"
  
  create_vnic_details {
    subnet_id = var.untrst_subnet_ocid
    assign_public_ip = var.assign_public_ip_secondary
	skip_source_dest_check = var.skip_source_dest_check
    assign_private_dns_record = var.assign_private_dns_record_secondary
  }
  
}

resource "oci_core_vnic_attachment" "secondary_vnic_2" {
  instance_id = oci_core_instance.generated_oci_core_instance.id
  display_name = "${var.display_name}-trust-vnic"
  
  create_vnic_details {
    subnet_id = var.trust_subnet_ocid
    assign_public_ip = var.assign_public_ip_secondary
	skip_source_dest_check = var.skip_source_dest_check
    assign_private_dns_record = var.assign_private_dns_record_secondary
  }
  
}

resource "oci_core_vnic_attachment" "secondary_vnic_3" {
  instance_id = oci_core_instance.generated_oci_core_instance.id
  display_name = "${var.display_name}-hub-vnic"
  
  create_vnic_details {
    subnet_id = var.hub_subnet_ocid
    assign_public_ip = var.assign_public_ip_secondary
	skip_source_dest_check = var.skip_source_dest_check
    assign_private_dns_record = var.assign_private_dns_record_secondary
  }
  
}

resource "oci_core_app_catalog_subscription" "generated_oci_core_app_catalog_subscription" {
	compartment_id =  var.compartment_ocid
	eula_link      = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.eula_link}"
	listing_id     = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.listing_id}"
	listing_resource_version = var.listing_resource_version
	oracle_terms_of_use_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.oracle_terms_of_use_link}"
	signature      = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.signature}"
	time_retrieved = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.time_retrieved}"
  
 
}

resource "oci_core_app_catalog_listing_resource_version_agreement" "generated_oci_core_app_catalog_listing_resource_version_agreement" {
	listing_id               = var.listing_id
	listing_resource_version = var.listing_resource_version
	

}

data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.compartment_ocid
}