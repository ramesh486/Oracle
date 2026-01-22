locals {
  subnet_configs = {
    for item in flatten([
      for env in local.nonprod_environments : [
        for subnet_name, def in var.vcn_nprd_jde_subnet_definitions : {
          key                        = "${env}_${subnet_name}"
          env                        = env
          subnet_name                = subnet_name
          display_name               = "${env}_${def.display_name}"
          cidr_block                 = lookup(def.cidr_blocks, env, "")
          dns_label                  = lookup(def.dns_labels, env, "")
          prohibit_internet_ingress  = def.prohibit_internet_ingress
          prohibit_public_ip_on_vnic = def.prohibit_public_ip_on_vnic
        }
      ]
      ]) : item.key => {
      environment                = item.env
      subnet_name                = item.subnet_name
      display_name               = item.display_name
      cidr_block                 = item.cidr_block
      dns_label                  = item.dns_label
      prohibit_internet_ingress  = item.prohibit_internet_ingress
      prohibit_public_ip_on_vnic = item.prohibit_public_ip_on_vnic
    }
  }
}

locals {
  prefix = "qco_ua1"
  # First, define all security lists for ALL environments in a nested map
  environment_project_tag = {
    sb = var.sb_project_tag
    ps = var.ps_project_tag
    tr = var.tr_project_tag
    dv = var.dv_project_tag
    qa = var.qa_project_tag
    py = var.py_project_tag
  }
  nonprod_environments = ["sb", "ps", "tr", "dv", "qa", "py"]


  subnet_names = ["lb", "web", "app"]

  security_list_configs = {
    for item in flatten([
      for env in local.nonprod_environments : [
        for sl_name in local.subnet_names : {
          key     = "${env}_${sl_name}"
          env     = env
          sl_name = sl_name
          rules = lookup(
            lookup(local.security_list_rules, sl_name, {}),
            env,
            {
              destination_rules = []
              source_rules      = []
            }
          )
        }
      ]
      ]) : item.key => {
      environment = item.env
      sl_name     = item.sl_name
      rules       = item.rules
    }
  }

  route_rule_configs = {
    for item in flatten([
      for env in local.nonprod_environments : [
        for rt_name in local.subnet_names : {
          key     = "${env}_${rt_name}"
          env     = env
          rt_name = rt_name
          rules = lookup(
            lookup(local.route_table_rules, rt_name, {}),
            env,
            []
          )
        }
      ]
      ]) : item.key => {
      environment = item.env
      rt_name     = item.rt_name
      rules       = item.rules
    }
  }
}
