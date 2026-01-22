

variable "vcn_nprd_jde_subnet_definitions" {
  type = map(object({
    display_name               = string
    cidr_blocks                = map(string)
    dns_labels                 = map(string)
    prohibit_internet_ingress  = bool
    prohibit_public_ip_on_vnic = bool
  }))

  default = {
    lb = {
      display_name               = "lb"
      cidr_blocks                = { sb = "10.241.60.0/25", ps = "10.241.48.128/25", tr = "10.241.51.0/25", dv = "10.241.54.0/25", qa = "10.241.57.0/25", py = "10.241.62.0/25" }
      dns_labels                 = { sb = "sblb", ps = "pslb", tr = "trlb", dv = "dvlb", qa = "qalb", py = "pylb" }
      prohibit_internet_ingress  = false
      prohibit_public_ip_on_vnic = false
    }
    web = {
      display_name               = "web"
      cidr_blocks                = { sb = "10.241.61.0/25", ps = "10.241.49.0/25", tr = "10.241.52.0/25", dv = "10.241.55.0/25", qa = "10.241.58.0/25", py = "10.241.62.128/25" }
      dns_labels                 = { sb = "sbweb", ps = "psweb", tr = "trweb", dv = "dvweb", qa = "qaweb", py = "pyweb" }
      prohibit_internet_ingress  = true
      prohibit_public_ip_on_vnic = true
    }

    app = {
      display_name               = "app"
      cidr_blocks                = { sb = "10.241.61.128/25", ps = "10.241.50.0/25", tr = "10.241.53.0/25", dv = "10.241.56.0/25", qa = "10.241.59.0/25", py = "10.241.63.0/25" }
      dns_labels                 = { sb = "sbapp", ps = "psapp", tr = "trapp", dv = "dvapp", qa = "qaapp", py = "pyapp" }
      prohibit_internet_ingress  = true
      prohibit_public_ip_on_vnic = true
    }
  }
}


variable "sb_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


variable "ps_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


variable "tr_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


variable "dv_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}

variable "qa_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}

variable "py_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}
