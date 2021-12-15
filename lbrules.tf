#creating the lb rule

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = azurerm_resource_group.rsg.name
  loadbalancer_id                = azurerm_lb.lb_web.id
  name                           = "web_lb_rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.lb_web.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_bepool.id]
}