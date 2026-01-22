# Production JDE VCN Stack (`qco-ua1-prod-jde-vcn-stack`)

## Overview
Terraform configuration for the Production JDE VCN. This stack hosts the Production JDE Application tier.

## Resources Created
- **VCN**: Prod JDE Virtual Cloud Network.
- **Subnets**: JDE Logic, Presentation, and other app-tier subnets.
- **Peering**:
  - LPG to `prod_hub_vcn`.
  - LPG to `prod_exadata_vcn`.
- **Gateways**: NAT Gateway, Service Gateway.
