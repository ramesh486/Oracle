

module "DBS" {
  source                                      = "./DBS"
  ssh_public_key                              = var.ssh_public_key
  tenancy_ocid                                = var.tenancy_ocid
  compartment_ocid                            = local.compartment_ocid
  primary_dbs_display_name                    = var.primary_dbs_display_name
  primary_dbs_hostname                        = var.primary_dbs_hostname
  primary_dbs_availability_domain             = var.primary_dbs_availability_domain
  secondary_dbs_display_name                  = var.secondary_dbs_display_name
  secondary_dbs_hostname                      = var.secondary_dbs_hostname
  secondary_dbs_availability_domain           = var.secondary_dbs_availability_domain
  dbs_db_name                                 = var.dbs_db_name
  admin_password                              = var.admin_password
  primary_dbs_subnet_ocid                     = local.db_nprd_subnet_ocid
  secondary_dbs_subnet_ocid                   = local.db_nprd_sec_subnet_ocid
  dbs_node_count                              = var.dbs_node_count
  is_dataguard_enabled                        = var.is_dataguard_enabled
  db_version                                  = var.db_version
  db_workload                                 = var.db_workload
  database_edition                            = var.database_edition
  data_storage_size_in_gb                     = var.data_storage_size_in_gb
  license_model                               = var.license_model
  auto_backup_enabled                         = var.auto_backup_enabled
  project_tag                                 = var.project_tag
  database_instance_shape                     = var.database_instance_shape
  time_zone                                   = var.time_zone
}
