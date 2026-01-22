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
# Security List Variables
# ----------------------------------------

variable "vcn_ocid" {}
variable "security_list_display_name" {}

variable "source_security_rules" {}
variable "destination_security_rules" {}