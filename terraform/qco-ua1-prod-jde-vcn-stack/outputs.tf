output "service_gateway" {
    description = "The Service Gateway SERVICE CIDR_BLOCK"
    value       = data.oci_core_services.this.services.1.cidr_block
}