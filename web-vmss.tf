#Creating a Linux vmss resource

resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                = "web-vmss"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
  upgrade_policy_mode  = "Automatic"

/*
  rolling_upgrade_policy {
    max_batch_instance_percent              = 20
    max_unhealthy_instance_percent          = 20
    max_unhealthy_upgraded_instance_percent = 5
    pause_time_between_batches              = "PT0S"
  }

  # required when using rolling upgrade policy
  health_probe_id = azurerm_lb_probe.example.id
  */

  sku {
    name     = var.webvm_size
    tier     = "Standard"
    capacity = var.webvm_vmss_instance
  }

  storage_profile_image_reference { 
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "7.5"
    version   = "latest"
    }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

  os_profile {
    computer_name_prefix = "${local.resource_name_prefix}-${var.webvm_hostname}"
    admin_username       = var.webvm_user
    admin_password       = var.webvm_password
    custom_data = filebase64("${path.module}/scripts/bootstrap.sh")
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "web-vmss-net"
    primary = true
    network_security_group_id = azurerm_network_security_group.vmss-nsg.id
    ip_configuration {
      name                                   = "webvmss-internal"
      primary                                = true
      subnet_id                              = azurerm_subnet.subnets["${var.webSubnetname}"].id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_bepool.id]
    }
  }

 
}

























/*
resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  count = var.webvm_instance
  name = "${local.resource_name_prefix}-${var.webvm_hostname}-${count.index}"
  resource_group_name = azurerm_resource_group.rsg.name
  location = azurerm_resource_group.rsg.location
  size = var.webvm_size
  admin_username = var.webvm_user
  admin_password = var.webvm_password
  disable_password_authentication = false
  network_interface_ids = [
    element(azurerm_network_interface.web_vnic[*].id, count.index)
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference { 
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "7.5"
    version   = "latest"
    }

    custom_data = filebase64("${path.module}/scripts/bootstrap.sh")
    
  }
  */

  
 