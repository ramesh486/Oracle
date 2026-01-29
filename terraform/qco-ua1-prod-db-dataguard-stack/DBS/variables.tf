################################################
# DATA DECLARATION 
################################################

data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}
 
################################################
# VARIABLE DECLARATION 
################################################

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "admin_password" {}
variable "dbs_db_name" {}
variable "primary_dbs_hostname" {}
variable "primary_dbs_display_name"{}
variable "primary_dbs_availability_domain" {}
variable "fault_domains" {
  default = [
    "FAULT-DOMAIN-1",
    "FAULT-DOMAIN-2",
    "FAULT-DOMAIN-3",
  ]
}
variable "secondary_dbs_display_name" {}
variable "secondary_dbs_hostname" {}
variable "secondary_dbs_availability_domain" {}
variable "ssh_public_key" {}
variable "database_instance_shape" {}
variable "dbs_node_count" {}
variable "storage_management" {
  default = "ASM"
}
variable "db_version" {}
variable "db_workload" {}
variable "database_edition" {}
variable "data_storage_size_in_gb" {}
variable "license_model" {}
variable "time_zone" {
  default = "UTC"
}
variable "character_set" {
  default = "AL32UTF8"
}
variable "ncharacter_set" {
  default = "AL16UTF16"
}
variable "primary_dbs_subnet_ocid" {}
variable "secondary_dbs_subnet_ocid" {}
variable "auto_backup_enabled" {}
variable "source_type" {
  default = "NONE"
}
variable "disk_redundancy" {
  default = "HIGH"
}
variable "project_tag" {
      type=map
      default = {
        definedTags = {}
        freeformTags = {}
      }
  }
variable "dataguard_protection_mode" {
  default="MAXIMUM_PERFORMANCE"
}
variable "dataguard_transport_type" {
  default = "ASYNC"
}
variable "delete_standby_db_home_on_delete" {
  default = "true"
}
variable "creation_type" {
  default = "NewDbSystem"
}
variable "is_dataguard_enabled" {}

