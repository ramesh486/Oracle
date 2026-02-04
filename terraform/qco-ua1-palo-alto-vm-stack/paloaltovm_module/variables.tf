variable "region" { }
variable "tenancy_ocid" { }
variable "compartment_ocid" { }

variable "subnet_ocid" { }
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
variable "assign_private_dns_record" { }
variable "assign_public_ip" { }
variable "are_legacy_imds_endpoints_disabled" { }


variable "display_name" { }
variable "shape" { }
variable "memory_in_gbs" { }
variable "ocpus" { }
variable "source_id" { }
variable "source_type" { }

variable "project_tag" {
    type = map
    default =  {
        definedTags = {}
        freeformTags = {}
    }
}














