################
### Paloaltovm
################ 

module "paloaltovm" {
        source                 = "./paloaltovm_module"
	    region                 = var.region
		tenancy_ocid           = var.tenancy_ocid
	    compartment_ocid       = local.app_compartment_ocid
		mgmt_subnet_ocid       = local.mgmt_subnet_ocid
		project_tag            = var.project_tag

		is_management_disabled = var.is_management_disabled
		is_monitoring_disabled = var.is_monitoring_disabled
		vulnerability_scanning_state = var.vulnerability_scanning_state
		vulnerability_scanning_name = var.vulnerability_scanning_name
		java_management_service_state = var.java_management_service_state
		java_management_service_name = var.java_management_service_name
		autonomous_linux_state = var.autonomous_linux_state
		autonomous_linux_name = var.autonomous_linux_name
		os_management_service_state = var.os_management_service_state
		os_management_service_name = var.os_management_service_name
		management_agent_state = var.management_agent_state
		management_agent_name = var.management_agent_name
		custom_logs_monitoring_state = var.custom_logs_monitoring_state
		custom_logs_monitoring_name = var.custom_logs_monitoring_name
		run_command_state = var.run_command_state
		run_command_name = var.run_command_name
		instance_monitoring_state = var.instance_monitoring_state
		instance_monitoring_name = var.instance_monitoring_name
		block_volume_management_state = var.block_volume_management_state
		block_volume_management_name = var.block_volume_management_name
		bastion_state = var.bastion_state
		bastion_name = var.bastion_name

    
    ssh_keys = var.ssh_keys
	recovery_action = var.recovery_action
	
	assign_private_dns_record_primary = var.assign_private_dns_record_primary
	assign_public_ip_primary = var.assign_public_ip_primary
	

	display_name = var.display_name
	are_legacy_imds_endpoints_disabled = var.are_legacy_imds_endpoints_disabled
	
	shape = var.shape
	memory_in_gbs = var.memory_in_gbs
	ocpus = var.ocpus
	
	source_id = var.source_id
	source_type = var.source_type

	listing_id = var.listing_id
	listing_resource_version = var.listing_resource_version

}

module "untrust_vnic" {
        source                 = "./untrustvnic_module"
		untrst_subnet_ocid     = local.untrst_subnet_ocid
		untrust_vnic_display_name  = var.untrst_vnic_display_name
		assign_private_dns_record_secondary = var.assign_private_dns_record_secondary
		assign_public_ip_secondary = var.assign_public_ip_secondary
		skip_source_dest_check = var.skip_source_dest_check

}

module "trust_vnic" {
        source                 = "./trustvnic_module"
		trust_subnet_ocid       = local.trust_subnet_ocid
		trust_vnic_display_name = var.trust_vnic_display_name
		assign_private_dns_record_secondary = var.assign_private_dns_record_secondary
		assign_public_ip_secondary = var.assign_public_ip_secondary
		skip_source_dest_check = var.skip_source_dest_check

}

module "hub_vnic" {
        source                 = "./hubvnic_module"
		hub_subnet_ocid        = local.hub_subnet_ocid
		hub_vnic_display_name  = var.hub_vnic_display_name
		assign_private_dns_record_secondary = var.assign_private_dns_record_secondary
		assign_public_ip_secondary = var.assign_public_ip_secondary
		skip_source_dest_check = var.skip_source_dest_check

}