#####################
# Common Compartment
#####################

variable "region" {
    type = string
    default = "us-ashburn-1"
    description = "Region (us-ashburn-1) to deploy the DRG"    
}

variable "tenancy_ocid"{
    type = string
    default =  ""
    description = "Tenancy ID (us-ashburn-1) to deploy the DRG"    
}

variable "user_ocid"{
    type = string
    default =  ""
    description = "User ID to deploy the DRG"    
}

variable "fingerprint"{
    type = string
    default =  ""
    description = "fingerprint to deploy the DRG"    
}

variable "api_private_key"{
    type = string
    default =  ""
    description = "private key to deploy the DRG"    
}

variable "app_compartment_id_in_subtree" {
  type = bool
  default = false
  description = "Compartment ID in Subtree"
}

variable "app_compartment_name" {
  type        = string
  default     = "qco-hub"
  description = "Compartment Name to deploy"
}

variable "network_compartment_id_in_subtree" {
    type        = bool
    default     = false
    description = "Compartment ID in Subtree"
}

variable "network_compartment_name" {
    type        = string
    default     = "qco-hub-network"
    description = "Compartment Name of the Subnet"
}

variable primary_mgmt_subnet_display_name{
  type        = string
  default     = "qco-ua1-prod-ha-sn"
  description = "Name of the primary mgmt Subnet"
}

variable secondary_untrust_subnet_display_name{
  type        = string
  default     = "qco-ua1-prod-ha-sn"
  description = "Name of the secondary untrust Subnet"
}

variable secondary_trust_subnet_display_name{
  type        = string
  default     = "qco-ua1-prod-ha-sn"
  description = "Name of the secondary trust Subnet"
}

variable secondary_hub_subnet_display_name{
  type        = string
  default     = "qco-ua1-prod-ha-sn"
  description = "Name of the secondary hub Subnet"
}

variable "project_tag" {
  description = "Tags to be Assigned to the Resources" 
  type = map
  default = {
    definedTags = {}
    freeformTags = {}
  }
}



####################################
# Virtual machine variables
####################################


variable "is_management_disabled" {
  type        = bool
  description = "is_management_disabled"  
 	default     = false 
}

variable "is_monitoring_disabled" {
  type        = bool
  description = "is_monitoring_disabled"  
 	default     = false 
}

variable "ssh_keys" {
  type = string
  description = "ssh authorized keys"
  default = ""
}


variable "vulnerability_scanning_state" {
  type        = string
  description = "OCI Vulnerability Scanning desired state"
  default     = "DISABLED"
}

variable "vulnerability_scanning_name" {
  type        = string
  description = "OCI Vulnerability Scanning name"
  default     = "Vulnerability Scanning"
}


variable "java_management_service_state" {
  type        = string
  description = "Oracle Java Management Service desired state"
  default     = "DISABLED"
}

variable "java_management_service_name" {
  type        = string
  description = "Oracle Java Management Service name"
  default     = "Oracle Java Management Service"
}


variable "autonomous_linux_state" {
  type        = string
  description = "Oracle Autonomous Linux desired state"
  default     = "DISABLED"
}

variable "autonomous_linux_name" {
  type        = string
  description = "Oracle Autonomous Linux name"
  default     = "Oracle Autonomous Linux"
}


variable "os_management_service_state" {
  type        = string
  description = "OS Management Service Agent desired state"
  default     = "ENABLED"
}

variable "os_management_service_name" {
  type        = string
  description = "OS Management Service Agent name"
  default     = "OS Management Service Agent"
}


variable "management_agent_state" {
  type        = string
  description = "OCI Management Agent desired state"
  default     = "DISABLED"
}

variable "management_agent_name" {
  type        = string
  description = "OCI Management name"
  default     = "Management Agent"
}


variable "custom_logs_monitoring_state" {
  type        = string
  description = "Custom Logs Monitoring desired state"
  default     = "ENABLED"
}

variable "custom_logs_monitoring_name" {
  type        = string
  description = "Custom Logs Monitoring name"
  default     = "Custom Logs Monitoring"
}


variable "run_command_state" {
  type        = string
  description = "Compute Instance Run Command desired state"
  default     = "ENABLED"
}

variable "run_command_name" {
  type        = string
  description = "Compute Instance Run Command name"
  default     = "Compute Instance Run Command"
}


variable "instance_monitoring_state" {
  type        = string
  description = "Compute Instance Monitoring desired state"
  default     = "ENABLED"
}

variable "instance_monitoring_name" {
  type        = string
  description = "Compute Instance Monitoring name"
  default     = "Compute Instance Monitoring"
}


variable "block_volume_management_state" {
  type        = string
  description = "Block Volume Management agent desired state"
  default     = "DISABLED"
}

variable "block_volume_management_name" {
  type        = string
  description = "Block Volume Management name"
  default     = "Block Volume Management"
}


variable "bastion_state" {
  type        = string
  description = "Bastion desired state"
  default     = "DISABLED"
}

variable "bastion_name" {
  type        = string
  description = "Bastion name"
  default     = "Bastion"
}


variable "recovery_action" {
  type        = string
  description = "recovery action"
  default     = "RESTORE_INSTANCE" 
}

variable "assign_private_dns_record_primary" {
  type        = bool
  description = "assign private dns record"
  default     = true 
}

variable "assign_public_ip_primary" {
  type        = bool
  description = "assign public ip"
  default     = false
}

variable "assign_private_dns_record_secondary" {
  type        = bool
  description = "assign private dns record"
  default     = false
}

variable "assign_public_ip_secondary" {
  type        = bool
  description = "assign public ip"
  default     = false
}

variable "skip_source_dest_check" {
  type        = bool
  description = "skip source dest check"
  default     = true
}

variable "listing_id" {
  type        = string
  description = "listing id"
  default     = ""
}

variable "listing_resource_version" {
  type        = string
  description = "listing resource version"
  default     = "10.2.3"
}

variable "are_legacy_imds_endpoints_disabled" {
  type        = bool
  description = "are legacy imds endpoints disabled"
  default     = false
}


variable "display_name" {
  type        = string
  description = "display name"
  default     = "qco-ua1-palo-alto-vm"
}

variable "hub_vnic_display_name" {
  type        = string
  description = "display name"
  default     = "qco-ua1-palo-alto-sec-hub-vnic"
}

variable "trust_vnic_display_name" {
  type        = string
  description = "display name"
  default     = "qco-ua1-palo-alto-vm-sec-trust-vnic"
}

variable "untrust_vnic_display_name" {
  type        = string
  description = "display name"
  default     = "qco-ua1-palo-alto-vm-sec-untrst-vnic"
}

variable "shape" {
  type        = string
  description = "shape"
  default     = "VM.Optimized3.Flex"
}

variable "memory_in_gbs" {
  type        = number
  description = "memory in gbs"
  default     = 14
}

variable "ocpus" {
  type        = number
  description = "ocpus"
  default     = 1
}

variable "source_id" {
  type        =  string
  description = "source id"
  default     = ""

}

variable "source_type" {
  type        =  string
  description = "source type"
  default     = "image"

}

variable "hub_nic_index" {
  type        =  number
  description = "hub vnic nic index"
  default     = 3

}

variable "trust_nic_index" {
  type        =  number
  description = "trust vnic nic index"
  default     = 2

}

variable "untrust_nic_index" {
  type        =  number
  description = "untrust vnic nic index"
  default     = 1

}


