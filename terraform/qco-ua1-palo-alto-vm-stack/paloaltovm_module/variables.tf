variable "region" { }
variable "tenancy_ocid" { }
variable "compartment_ocid" { }

variable "mgmt_subnet_ocid" { }
variable "untrst_subnet_ocid" { }
variable "trust_subnet_ocid" { }
variable "hub_subnet_ocid" { }
variable "is_management_disabled" { }
variable "is_monitoring_disabled" { }
variable "ssh_keys" { }
variable "desired_state1" { }
variable "name1" { }
variable "desired_state2" { }
variable "name2" { }
variable "desired_state3" { }
variable "name3" { }
variable "desired_state4" { }
variable "name4" { }
variable "desired_state5" { }
variable "name5" { }
variable "desired_state6" { }
variable "name6" { }
variable "desired_state7" { }
variable "name7" { }
variable "desired_state8" { }
variable "name8" { }
variable "desired_state9" { }
variable "name9" { }
variable "desired_state10" { }
variable "name10" { }

variable "recovery_action" { }
variable "assign_private_dns_record_primary" { }
variable "assign_public_ip_primary" { }
variable "assign_private_dns_record_secondary" { }
variable "assign_public_ip_secondary" { }
variable "are_legacy_imds_endpoints_disabled" { }


variable "display_name" { }
variable "shape" { }
variable "memory_in_gbs" { }
variable "ocpus" { }
variable "listing_id" { }
variable "listing_resource_version" { }
variable "skip_source_dest_check" { }
variable "source_id" { }
variable "source_type" { }

variable "project_tag" {
    type = map
    default =  {
        definedTags = {}
        freeformTags = {}
    }
}














