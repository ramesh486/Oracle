resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = var.is_management_disabled
		is_monitoring_disabled = var.is_monitoring_disabled
		

		plugins_config {
			desired_state = var.vulnerability_scanning_state
			name = var.vulnerability_scanning_name
		}
		plugins_config {
			desired_state = var.java_management_service_state
			name = var.java_management_service_name
		}
		plugins_config {
			desired_state = var.autonomous_linux_state
			name = var.autonomous_linux_name
		}
		plugins_config {
			desired_state = var.os_management_service_state
			name = var.os_management_service_name
		}
		plugins_config {
			desired_state = var.management_agent_state
			name = var.management_agent_name
		}
		plugins_config {
			desired_state = var.custom_logs_monitoring_state
			name = var.custom_logs_monitoring_name
		}
		plugins_config {
			desired_state = var.run_command_state
			name = var.run_command_name
		}
		plugins_config {
			desired_state = var.instance_monitoring_state
			name = var.instance_monitoring_name
		}
		plugins_config {
			desired_state = var.block_volume_management_state
			name = var.block_volume_management_name
		}
		plugins_config {
			desired_state = var.bastion_state
			name = var.bastion_name
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