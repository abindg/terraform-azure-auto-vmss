resource "azurerm_network_security_group" "vmss-nsg" {
    name = "${local.resource_name_prefix}-web-vmss-nsg"
    location = azurerm_resource_group.rsg.location
    resource_group_name = azurerm_resource_group.rsg.name
    dynamic "security_rule"{
        for_each = var.webvm_vmss_sec_ports
        content {
            name                       = "Inbound-rule-${security_rule.value}"
            priority                   = sum([100, security_rule.key])
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = security_rule.value
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
    }  
}