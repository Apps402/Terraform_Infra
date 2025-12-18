resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnet
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    address_space       = each.value.address_space
    dns_servers         = each.value.dns_servers
    bgp_community = each.value.bgp_community
    
    dynamic ddos_protection_plan {
        for_each = each.value.ddos_protection_plan == null  ? []:each.value.ddos_protection_plan
        content {
          id = ddos_protection_plan.value.id
          enable = ddos_protection_plan.value.enable
        }
      
    }
    dynamic encryption {
        for_each = each.value.encryption == null ? []:each.value.encryption
        content {
          enforcement = encryption.value.enforcement
        }
      
    }
    edge_zone = each.value.edge_zone
    flow_timeout_in_minutes = each.value.flow_timeout_in_minutes
    dynamic ip_address_pool {
      for_each = each.value.ip_address_pool ==null ? []:each.value.ip_address_pool
      content {
        id = ip_address_pool.value.id
        number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
      }
    }

   private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
   
 
  dynamic subnet {
    for_each = each.value.subnet ==null ? []:each.value.subnet
    content {
        name = subnet.value.name
        address_prefixes = subnet.value.address_prefixes
        dynamic "delegation" {
           for_each = subnet.value.delegation ==null ? []:subnet.value.delegation
           content {
              name = subnet.value.delegation.name
              service_delegation {
                name = delegation.value.service_delegation.name
    }
  }
    
  }
      
    }
    
  }
  

  
     tags = each.value.tags

   
}