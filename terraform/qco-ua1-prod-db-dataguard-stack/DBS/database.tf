
resource oci_database_db_system DBS {
  availability_domain          = var.primary_dbs_availability_domain
  compartment_id               = var.compartment_ocid
  data_storage_size_in_gb      = var.data_storage_size_in_gb
  database_edition             = var.database_edition
  db_home {
    database {
      admin_password           = var.admin_password
      character_set            = var.character_set
      db_backup_config {
        auto_backup_enabled    = var.auto_backup_enabled
        auto_backup_window     = ""
      }
      db_name                  = var.dbs_db_name
      db_workload              = var.db_workload
      # defined_tags             = var.project_tag.definedTags
      ncharacter_set           = var.ncharacter_set
      tde_wallet_password      = var.admin_password
    }
    db_version                 = var.db_version
    # defined_tags               = var.project_tag.definedTags
    display_name               = var.dbs_db_name
  }
  db_system_options {
    storage_management           = var.storage_management
  }
  defined_tags                   = var.project_tag.definedTags
  freeform_tags                  = var.project_tag.freeformTags
  disk_redundancy                = var.disk_redundancy
  display_name                   = "${var.primary_dbs_display_name}"
  fault_domains                  = var.fault_domains
  hostname                       = var.primary_dbs_hostname
  license_model                  = var.license_model
  node_count                     = var.dbs_node_count
  shape                          = var.database_instance_shape
  source                         = var.source_type
  ssh_public_keys                = [ var.ssh_public_key ]
  subnet_id                      = var.primary_dbs_subnet_ocid
  time_zone                      = var.time_zone
  timeouts {
    create = "10h"
  }
}


resource "oci_database_data_guard_association" "home_data_guard_association" {
    depends_on = [
      oci_database_db_system.DBS,
    ]
    count                            = "${var.is_dataguard_enabled == "true" ? 1 : 0}"
    creation_type                    = var.creation_type
    database_admin_password          = var.admin_password
    database_id                      = oci_database_db_system.DBS.db_home[0].database[0].id
    delete_standby_db_home_on_delete = var.delete_standby_db_home_on_delete
    protection_mode                  = var.dataguard_protection_mode
    transport_type                   = var.dataguard_transport_type

    availability_domain              = var.secondary_dbs_availability_domain
    display_name                     = "${var.secondary_dbs_display_name}"
    hostname                         = "${var.secondary_dbs_hostname}"
    shape                            = var.database_instance_shape
    subnet_id                        = var.secondary_dbs_subnet_ocid
    timeouts {
      create = "10h"
  }
}


