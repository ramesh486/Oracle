# ----------------------------------------
# Common Variables
# ----------------------------------------

variable compartment_ocid {}

variable "definedTags" {
  type = map
  default = {}
}

variable "freeformTags" {
    type = map
    default = {}
}

variable "drg_ocid" {}
variable "vcn_ocid" {}
variable "oci_core_drg_attachment_display_name" {}
variable "drg_route_table_ocid" {}