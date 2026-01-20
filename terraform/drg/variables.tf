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

variable "drg_display_name" {
    type = string
    default = ""
    description = ""
}

### END