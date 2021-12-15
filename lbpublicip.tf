#Creating public Ip for LB
resource "azurerm_public_ip" "lbpubip" {
    name = "${local.resource_name_prefix}-${var.lb_pubipname}"
    resource_group_name = azurerm_resource_group.rsg.name
    location = azurerm_resource_group.rsg.location
    allocation_method = "Static" 
    sku = "Standard"    
}