#Creating the azure standard load balancer front end
resource "azurerm_lb" "lb_web" {
  name                = "${local.resource_name_prefix}-${var.weblbname}"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
  sku = "Standard"
  frontend_ip_configuration {
    name = "lb_web_fip-1"
    public_ip_address_id = azurerm_public_ip.lbpubip.id
  }
}

#Defining the Backend pool resource

resource "azurerm_lb_backend_address_pool" "lb_bepool" {
  loadbalancer_id = azurerm_lb.lb_web.id
  name            = "lb_bepool_1"
}

# Creating the lb heath probe
resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = azurerm_resource_group.rsg.name
  loadbalancer_id     = azurerm_lb.lb_web.id
  name                = "tcp_probe"
  protocol = "Tcp"
  port                = 80
}
