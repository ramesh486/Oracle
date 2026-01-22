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
# Route Table Variables
# ----------------------------------------

variable "vcn_ocid" {}
variable "route_table_display_name" {}
variable "route_rules" {}