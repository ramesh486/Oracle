###  DRG Variables ### 

variable compartment_ocid {
    type = string
    default = ""
    description = ""
}

variable "definedTags" {
    type = map
    default = {}
    description = ""
}

variable "freeformTags" {
    type = map
    default = {}
    description = ""
}

variable "drg_route_distribution_ocid" {
    type = string
    default = ""
    description = ""
}

variable "drg_route_table_display_name" {
    type = string
    default = ""
    description = ""
}

variable "drg_route_table_is_ecmp_enabled" {
    type = bool
    default = false
    description = ""
}

variable "drg_ocid" {
    type = string
    default = ""
    description = ""
}
