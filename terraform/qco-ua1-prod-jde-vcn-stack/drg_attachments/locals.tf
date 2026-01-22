locals {
  network_details_type = "VCN"
  vcn_route_type = "SUBNET_CIDRS"
  drg_distribution_type = "IMPORT"
  drg_route_distribution_statement_action = "ACCEPT"
  drg_route_distribution_match_type = "DRG_ATTACHMENT_TYPE"
  drg_route_distribution_attachment_type = {
      VCN = "VCN"
      VIRTUAL_CIRCUIT = "VIRTUAL_CIRCUIT"
      IPSEC_TUNNEL = "IPSEC_TUNNEL"
      REMOTE_PEERING_CONNECTION = "REMOTE_PEERING_CONNECTION"
  }
}