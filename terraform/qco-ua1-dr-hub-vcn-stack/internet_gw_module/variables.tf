# ----------------------------------------
# Common Variables
# ----------------------------------------

variable compartment_ocid {}
variable "definedTags" {
  type = map
}
variable "freeformTags" {
  type = map
}

# ----------------------------------------
# Internet Gateway Variables
# ----------------------------------------

variable "vcn_ocid" {}
variable "intgw_display_name" {}
variable "intgw_enabled" {}