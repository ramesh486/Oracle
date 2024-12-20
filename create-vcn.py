import oci

config = oci.config.from_file("~/.oci/config", "DEFAULT")  

virtual_network_client = oci.core.VirtualNetworkClient(config) 

# Create the VCN
vcn_details = oci.core.models.CreateVcnDetails(
    compartment_id="ocid1.compartment.oc1..aaaaaaaa7nhpsworbxrgut7cwvsjzpp6cba33sq6jnxwkotzo4toc3juqwqa",
    display_name="SDK_VCN",
    cidr_block="10.0.0.0/16"
)

try:
    response = virtual_network_client.create_vcn(vcn_details)
    print("VCN created successfully")
except oci.exceptions.ServiceError as OC:
    print(f"Error creating VCN: {OC}")
