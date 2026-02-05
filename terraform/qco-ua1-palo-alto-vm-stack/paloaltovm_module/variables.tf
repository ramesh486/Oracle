variable "region" { }
variable "tenancy_ocid" { }
variable "compartment_ocid" { }

variable "mgmt_subnet_ocid" { }
variable "is_management_disabled" { }
variable "is_monitoring_disabled" { }
variable "ssh_keys" { }
variable "vulnerability_scanning_state" { }
variable "vulnerability_scanning_name" { }
variable "java_management_service_state" { }
variable "java_management_service_name" { }
variable "autonomous_linux_state" { }
variable "autonomous_linux_name" { }
variable "os_management_service_state" { }
variable "os_management_service_name" { }
variable "management_agent_state" { }
variable "management_agent_name" { }
variable "custom_logs_monitoring_state" { }
variable "custom_logs_monitoring_name" { }
variable "run_command_state" { }
variable "run_command_name" { }
variable "instance_monitoring_state" { }
variable "instance_monitoring_name" { }
variable "block_volume_management_state" { }
variable "block_volume_management_name" { }
variable "bastion_state" { }
variable "bastion_name" { }

variable "recovery_action" { }
variable "assign_private_dns_record_primary" { }
variable "assign_public_ip_primary" { }
variable "are_legacy_imds_endpoints_disabled" { }


variable "display_name" { }
variable "shape" { }
variable "memory_in_gbs" { }
variable "ocpus" { }
variable "listing_id" { }
variable "listing_resource_version" { }
variable "source_id" { }
variable "source_type" { }

variable "project_tag" {
    type = map
    default =  {
        definedTags = {}
        freeformTags = {}
    }
}














