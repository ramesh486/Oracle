################
### Paloaltovm
################ 

module "paloaltovm" {
        source                 = "./paloaltovm_module"
	    region                 = var.region
		tenancy_ocid           = var.tenancy_ocid
	    compartment_ocid       = local.app_compartment_ocid
		subnet_ocid            = local.subnet_ocid
		project_tag            = var.project_tag


		is_management_disabled = var.is_management_disabled
		is_monitoring_disabled = var.is_monitoring_disabled
		
		desired_state1 = var.desired_state1
		name1 = var.name1
		desired_state2 = var.desired_state2
		name2 = var.name2
		desired_state3 = var.desired_state3
		name3 = var.name3
		desired_state4 = var.desired_state4
		name4 = var.name4
		desired_state5 = var.desired_state5
		name5 = var.name5
		desired_state6 = var.desired_state6
		name6 = var.name6
		desired_state7 = var.desired_state7
		name7 = var.name7
		desired_state8 = var.desired_state8
		name8 = var.name8
		desired_state9 = var.desired_state9
		name9 = var.name9
		desired_state10 = var.desired_state10
		name10 = var.name10

    
    ssh_authorized_keys = var.ssh_keys
	recovery_action = var.recovery_action
	
	assign_private_dns_record = var.assign_private_dns_record
	assign_public_ip = var.assign_public_ip

	display_name = var.display_name
	are_legacy_imds_endpoints_disabled = var.are_legacy_imds_endpoints_disabled
	
	shape = var.shape
	memory_in_gbs = var.memory_in_gbs
	ocpus = var.ocpus
	
	source_id = var.source_id
	source_type = var.source_type

}