# ----------------------------------------
# Common Variables
# ----------------------------------------

variable "compartment_ocid" {
  type = string
}

variable "definedTags" {
  # defined tags are usually map(any)
  type    = map(any)
  default = {}
}

variable "freeformTags" {
  type    = map(string)
  default = {}
}

variable "vcn_ocid" {
  type = string
}

variable "servicegw_display_name" {
  type = string
}
