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
# Service Gateway Variables
# ----------------------------------------

variable "vcn_ocid" {}
variable "servicegw_display_name" {}