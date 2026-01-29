Before Proceeding:

1) Create required tag-namespaces and tag-values accordingly in OCI console:
    
    1.1) OCI console -> Tag-namespaces -> Create Tag-Namespace -> Create Tag-Key and Tag-value


2) Create a VCN with two subnets, Dataguard uses port number 1521 for communication between primary DBS and secondary DBS, edit the security list to allow port number 1521 on both the subnets.
    
    2.1) Primary Subnet should have the following rules:
        Security List for Subnet on the Primary DB System

        Ingress Rules:
                        Stateless: No
                        Source: 10.0.1.0/24 (Secondary subnet's CIDR block)
                        IP Protocol: TCPSource Port Range: All 
                        Destination Port Range: 1521
                        Allows: TCP traffic for ports: 1521

        Egress Rules:

                        Stateless: No
                        Destination: 10.0.1.0/24 (Secondary subnet's CIDR block)
                        IP Protocol: TCP 
                        Source Port Range: All
                        Destination Port Range: 1521
                        Allows: TCP traffic for ports: 1521
                    
    2.2) Secondary Subnet should have the following rules:
        Security List for Subnet on the Standby DB System

        Ingress Rules:	

                        Stateless: No
                        Source: 10.0.0.0/24 (Primary subnet's CIDR block)
                        IP Protocol: TCP 
                        Source Port Range: All 
                        Destination Port Range: 1521
                        Allows: TCP traffic for ports: 1521

        Egress Rules:

                        Stateless: No
                        Destination: 10.0.0.0/24 (Primary subnet's CIDR block)
                        IP Protocol: TCP 
                        Source Port Range: All
                        Destination Port Range: 1521
                        Allows: TCP traffic for ports: 1521



## Contents in main.tf:
    1) Provisions the one or two node RAC DBS cluster with Dataguard enabled for Disaster Recovery
    2) main.tf includes module DBS/database.tf
    3) main.tf captures the variables and sends it to the database module


## Contents in DBS/database.tf:
    1) "ENTERPRISE_EDITION_EXTREME_PERFORMANCE" Database edition only supported to enable Dataguard 
    2) Database workload: "OLTP" OR "DW"
    3) Storage Management: "ASM"
    4) If the dataguard is enabled then Dataguard creates a replica of primary dbs, same configuration will be used for secondary dbs
    5) Time Zone for DBS is "UTC", can be changed
    6) If both Primary DBS and Secondary DBS are in different VCN make sure to peer the VCNs with each other.
    7) Primary DBS will be deployed in primary subnet.
    8) Secondary DBS will be deployed in secondary subnet.

